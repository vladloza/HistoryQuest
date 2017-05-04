QuestMap = function () {
    QuestMap.initializeBase(this);

    this.CenterOfUkraine = { lat: 49.0, lng: 32.0 };
    this.MaxDistanceFromCenter = 700; //km
    this.ReturnDelay = 1500; //ms
    this.MarkersDropDelay = 1200; //ms

    this.googleMap = null;
    this.centerChangedTimeoutID = null;
};

QuestMap.prototype = {
    initialize: function () {
        QuestMap.callBaseMethod(this, "initialize");
    },

    initializeMap: function (questGID) {
        if (window.CurrentQuestGID) {
            WebService.GetQuestCheckPoints(window.CurrentQuestGID, Function.createDelegate(this, this.onLoadSuccess));
        }
    },

    onLoadSuccess: function (result) {
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

        this.googleMap = new google.maps.Map(document.getElementById('map'), {
            center: this.CenterOfUkraine,
            zoom: 6,
            minZoom: 6,
            maxZoom: 12,
            disableDefaultUI: true,
            zoomControl: true
        });

        this.googleMap.setOptions({ styles: styles["retro"] });

        this.googleMap.addListener('center_changed', Function.createDelegate(this, this.fixMapCenter));

        if (result && result.CheckPoints) {
            window.setTimeout(Function.createDelegate(this, function () {
                for (var i = 0; i < result.CheckPoints.length; i++) {
                    var coords = result.CheckPoints[i].GeoCoordinates.split(';');
                    var marker = new google.maps.Marker({
                        position: { lat: Number(coords[0]), lng: Number(coords[1]) },
                        map: this.googleMap,
                        animation: google.maps.Animation.DROP,
                        title: result.CheckPoints[i].Name
                    });

                    if (result.CheckPoints[i].IsCompleted === true) {
                        marker.setIcon('/libs/img/checkpoint_completed.png');
                    } else if (result.CheckPoints[i].IsCurrent === true) {
                        marker.setIcon('/libs/img/checkpoint_current.png');

                        var createListener = function (checkPointNum) {
                            return function () { window.location = "/Default.aspx?cpgid=" + result.CheckPoints[checkPointNum].gid; };
                        };

                        marker.addListener('click', createListener(i));
                    } else {
                        marker.setIcon('/libs/img/checkpoint_locked.png');
                    }
                }
            }), this.MarkersDropDelay);
        }
    },

    fixMapCenter: function () {
        window.clearTimeout(this.centerChangedTimeoutID);
        if (this.isCenterOutOfBorder()) {
            this.centerChangedTimeoutID.timeoutID = window.setTimeout(Function.createDelegate(this, function () {
                this.googleMap.panTo(this.CenterOfUkraine);
            }), this.ReturnDelay);
        }
    },

    isCenterOutOfBorder: function () {
        var center = new google.maps.LatLng(this.CenterOfUkraine.lat, this.CenterOfUkraine.lng);
        return QuestMap.CalculateDistance(center, this.googleMap.center) > QuestMap.MaxDistanceFromCenter;
    }
};

QuestMap.InitializeMap = function () {
    var component = $find("QuestMap");

    if (component !== null) {
        component.initializeMap();
    }
};

//calculates distance between two points in km's
QuestMap.CalculateDistance = function (p1, p2) {
    return (google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000).toFixed(2);
};

QuestMap.registerClass('QuestMap', Sys.Component);