window.onload = function () {

    var canvas = document.getElementsByClassName('radialBar');
    var ctx = [];
    bars = [];
    for (var i = 0; i < canvas.length; i++) {
        ctx[i] = canvas[i].getContext('2d');

        canvas[i].width = 120;
        canvas[i].height = 120;

        bars[i] = new RadialBar(ctx[i], {
            x: 60,
            y: 60,
            angle: 0,
            radius: 55,
            lineWidth: 4,
            percent: canvas[i].getAttribute('percent'),
            maxValue: canvas[i].getAttribute('data-maxValue'),
            lineFill: '#d0c3c3',
            backLineFill: '#ff913b',
            bgFill: '#fff',
            isShowInfoText: true,
            infoStyle: '24px Arial',
            infoColor: '#485c65'
        });
    } 

    function loop() {
        for (var i = 0; i < canvas.length; i++) {
            ctx[i].clearRect(0, 0, canvas[i].width, canvas[i].height);

            bars[i].add(0.2);
            bars[i].stop(canvas[i].getAttribute('data-value'));
            bars[i].update();
        }
        requestAnimationFrame(loop);
    }
    loop();
}