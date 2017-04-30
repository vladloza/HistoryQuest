QuestMap = {
    CenterOfUkraine: { lat: 49.0, lng: 32.0 },
    MaxDistanceFromCenter: 700, //km
    ReturnDelay: 1500, //ms
    MarkersDropDelay: 1200 //ms
};

QuestMap.prototype = function () {

};

QuestMap.InitializeMap = function () {
    WebService.GetQuestCheckPoints('AC62EA9D-536C-4C92-B7B1-E3E3E375FDCF', QuestMap.OnLoadSuccess);
};

QuestMap.OnLoadSuccess = function (result) {

    var styles = {
        retro: [
            { elementType: 'geometry', stylers: [{ color: '#ebe3cd' }] },
            { elementType: 'labels.text.fill', stylers: [{ color: '#523735' }] },
            { elementType: 'labels.text.stroke', stylers: [{ color: '#f5f1e6' }] },
            {
                featureType: 'administrative',
                elementType: 'geometry.stroke',
                stylers: [{ color: '#d16a34' }]
            },
            {
                featureType: 'administrative.land_parcel',
                elementType: 'geometry.stroke',
                stylers: [{ color: '#dcd2be' }]
            },
            {
                featureType: 'administrative.land_parcel',
                elementType: 'labels.text.fill',
                stylers: [{ color: '#ae9e90' }]
            },
            {
                featureType: 'landscape.natural',
                elementType: 'geometry',
                stylers: [{ color: '#dfd2ae' }]
            },
            {
                featureType: 'poi',
                elementType: 'geometry',
                stylers: [{ color: '#dfd2ae' }]
            },
            {
                featureType: 'poi',
                elementType: 'labels.text.fill',
                stylers: [{ color: '#93817c' }]
            },
            {
                featureType: 'poi.park',
                elementType: 'geometry.fill',
                stylers: [{ color: '#a5b076' }]
            },
            {
                featureType: 'poi.park',
                elementType: 'labels.text.fill',
                stylers: [{ color: '#447530' }]
            },
            {
                featureType: 'road',
                elementType: 'geometry',
                stylers: [{ color: '#f5f1e6' }, { visibility: 'off' }]
            },
            {
                featureType: 'road',
                elementType: 'labels',
                stylers: [{ visibility: 'off' }]
            },
            {
                featureType: 'poi.business',
                stylers: [{ visibility: 'off' }]
            },
            {
                featureType: 'transit',
                elementType: 'labels.icon',
                stylers: [{ visibility: 'off' }]
            },
            {
                featureType: 'water',
                elementType: 'geometry.fill',
                stylers: [{ color: '#b9d3c2' }]
            },
            {
                featureType: 'water',
                elementType: 'labels.text.fill',
                stylers: [{ color: '#92998d' }]
            }
        ]
    };

    QuestMap.Map = new google.maps.Map(document.getElementById('map'), {
        center: QuestMap.CenterOfUkraine,
        zoom: 6,
        minZoom: 6,
        maxZoom: 12,
        disableDefaultUI: true,
        zoomControl: true
    });

    QuestMap.Map.setOptions({ styles: styles["retro"] });

    QuestMap.Map.addListener('center_changed', function () {
        window.clearTimeout(QuestMap.InitializeMap.timeoutID);
        if (QuestMap.IsCenterOutOfBorder()) {
            QuestMap.InitializeMap.timeoutID = window.setTimeout(function () {
                QuestMap.Map.panTo(QuestMap.CenterOfUkraine);
            }, QuestMap.ReturnDelay);
        }
    });

    if (result && result.CheckPoints) {
        window.setTimeout(function () {
            for (var i = 0; i < result.CheckPoints.length; i++) {
                var coords = result.CheckPoints[i].GeoCoordinates.split(';');
                var marker = new google.maps.Marker({
                    position: { lat: Number(coords[0]), lng: Number(coords[1]) },
                    map: QuestMap.Map,
                    animation: google.maps.Animation.DROP,
                    title: result.CheckPoints[i].Name
                });

                if (result.CheckPoints[i].IsCompleted === true) {
                    marker.setIcon('/libs/img/checkpoint_completed.png');
                } else {
                    marker.setIcon('/libs/img/checkpoint_new.png');

                    var createListener = function (checkPointNum) {
                        return function () { window.location = "/Default.aspx?cpgid=" + result.CheckPoints[checkPointNum].gid; };
                    };

                    marker.addListener('click', createListener(i));
                }
            }
        }, QuestMap.MarkersDropDelay);
    }
};

//calculates distance between two points in km's
QuestMap.CalculateDistance = function (p1, p2) {
    return (google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000).toFixed(2);
};

QuestMap.IsCenterOutOfBorder = function () {
    var center = new google.maps.LatLng(QuestMap.CenterOfUkraine.lat, QuestMap.CenterOfUkraine.lng);
    return QuestMap.CalculateDistance(center, QuestMap.Map.center) > QuestMap.MaxDistanceFromCenter;
};