// Define a plugin to provide data labels
var dataLabelPlugin =({
    afterDatasetsDraw: function (chart, easing) {
        // To only draw at the end of animation, check for easing === 1
        var ctx = chart.ctx;

        chart.data.datasets.forEach(function (dataset, i) {
            var meta = chart.getDatasetMeta(i);
            if (!meta.hidden) {
                meta.data.forEach(function (element, index) {
                    // Draw the text in black, with the specified font
                    ctx.fillStyle = 'rgb(255, 255, 255)';

                    var fontSize = 16;
                    var fontStyle = 'bold';
                    var fontFamily = 'Helvetica Neue';
                    ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                    // Just naively convert to string for now
                    var dataString = dataset.data[index].toString();

                    // Make sure alignment settings are correct
                    ctx.textAlign = 'center';
                    ctx.textBaseline = 'middle';

                    var padding = 5;
                    var position = element.tooltipPosition();
                    if (dataset.data[index] != 0) {
                        ctx.fillText(dataString, position.x, position.y - (fontSize / 2) + padding);
                    };
                });
            }
        });
    }
});
