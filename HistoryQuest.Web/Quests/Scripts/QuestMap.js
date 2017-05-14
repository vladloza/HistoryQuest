QuestMap = function () {
    QuestMap.initializeBase(this);

    this.MaxDistanceFromCenter = 700; //km
    this.ReturnDelay = 1500; //ms
    this.MarkersDropDelay = 1200; //ms

    QuestMap.googleMap = null;
    this.checkPointsLis = null;
};

QuestMap.googleMap = null;

QuestMap.CenterOfUkraine = { lat: 49.0, lng: 32.0 };

QuestMap.styles = {
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
        QuestMap.googleMap = new google.maps.Map(document.getElementById('map'), {
            center: QuestMap.CenterOfUkraine,
            zoom: 6,
            minZoom: 6,
            maxZoom: 12,
            disableDefaultUI: true,
            zoomControl: true
        });

        QuestMap.googleMap.setOptions({ styles: QuestMap.styles["retro"] });

        QuestMap.googleMap.addListener('center_changed', Function.createDelegate(this, this.fixMapCenter));

        if (result && result.CheckPoints) {
            var createListener = function (checkPointNum) {
                return function () {
                    document.currentCheckPointGid = result.CheckPoints[checkPointNum].gid;

                    WebService.GetCheckPointLikesCount(document.currentCheckPointGid);
                    $("#CheckPointName").text(result.CheckPoints[checkPointNum].Name);
                    $("#CheckPointShortInfo").text(result.CheckPoints[checkPointNum].Info);

                    if (result.CheckPoints[checkPointNum].IsCurrent) {
                        $("#StartCheckPoint").attr("checkPointGID", result.CheckPoints[checkPointNum].gid);
                        $("#StartCheckPoint").attr("style", "");
                    } else {
                        $("#StartCheckPoint").attr("style", "display: none");
                    }
                    $("#quest-info").toggleClass("active", true);
                };
            };

            window.setTimeout(Function.createDelegate(this, function () {
                for (var i = 0; i < result.CheckPoints.length; i++) {
                    var coords = result.CheckPoints[i].GeoCoordinates.split(';');
                    var marker = new google.maps.Marker({
                        position: { lat: Number(coords[0]), lng: Number(coords[1]) },
                        map: QuestMap.googleMap,
                        animation: google.maps.Animation.DROP,
                        title: result.CheckPoints[i].Name
                    });

                    if (result.CheckPoints[i].IsCompleted === true) {
                        marker.setIcon('/libs/img/checkpoint_completed.png');
                    } else if (result.CheckPoints[i].IsCurrent === true) {
                        marker.setIcon('/libs/img/checkpoint_current.png');
                    } else {
                        marker.setIcon('/libs/img/checkpoint_locked.png');
                    }

                    marker.addListener('click', createListener(i));
                }
            }), this.MarkersDropDelay);

            $("#menu-toggle").attr("style", "display: none");
            $("#quest-info").toggleClass("active", false);

            var currentCheckPointId = QuestMap.FindIndex(result.CheckPoints, function (item) { return item.IsCurrent === true; });

            if (currentCheckPointId > -1) {
                $("#menu-toggle").attr("style", "");
                createListener(currentCheckPointId)();
            }
        }
    },

    fixMapCenter: function () {
        window.clearTimeout(this.centerChangedTimeoutID);
        if (this.isCenterOutOfBorder()) {
            this.centerChangedTimeoutID = window.setTimeout(Function.createDelegate(this, function () {
                QuestMap.googleMap.panTo(QuestMap.CenterOfUkraine);
            }), this.ReturnDelay);
        }
    },

    isCenterOutOfBorder: function () {
        var center = new google.maps.LatLng(QuestMap.CenterOfUkraine.lat, QuestMap.CenterOfUkraine.lng);
        return QuestMap.CalculateDistance(center, QuestMap.googleMap.center) > this.MaxDistanceFromCenter;
    }
};

QuestMap.FindIndex = function (collection, predicate) {
    for (var i = 0; i < collection.length; i++) {
        if (predicate(collection[i])) {
            return i;
        }
    }

    return -1;
};

QuestMap.InitializeMap = function () {
    var component = $find("QuestMap");

    if (component !== null) {
        component.initializeMap();
    }
};

QuestMap.InitializeTaskMap = function () {
    function placeMarker(location) {
        if (this.marker) {
            this.marker.setMap(null);
        }

        this.marker = new google.maps.Marker({
            position: location,
            map: QuestMap.googleMap
        });

        this.marker.setIcon('/libs/img/checkpoint_current.png');
        $("#map").attr("userAnswer", location.lat() + ";" + location.lng());
    }

    var mapContainer = document.getElementById("map");

    if (mapContainer !== null) {
        QuestMap.googleMap = new google.maps.Map(mapContainer, {
            center: QuestMap.CenterOfUkraine,
            zoom: 6,
            minZoom: 6,
            maxZoom: 12,
            disableDefaultUI: true,
            zoomControl: true
        });
        
        QuestMap.googleMap.setOptions({ styles: QuestMap.styles["retro"] });

        var marker = null;

        google.maps.event.addListener(QuestMap.googleMap, 'click', Function.createDelegate(this, function (event) {
            placeMarker(event.latLng);
        }));

        if (mapContainer.attributes.startCoords) {
            var coords = mapContainer.attributes.startCoords.value.split(';');
            placeMarker(new google.maps.LatLng(Number(coords[0]), Number(coords[1])));
        }
    }
};

//calculates distance between two points in km's
QuestMap.CalculateDistance = function (p1, p2) {
    return (google.maps.geometry.spherical.computeDistanceBetween(p1, p2) / 1000).toFixed(2);
};

QuestMap.registerClass('QuestMap', Sys.Component);