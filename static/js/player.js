// Parse the JSON file and start the tour.

(function getJSONData() {
  var steps = [];

  $.getJSON("static/guide.json", function (data) {
    $.each(data.steps, function (index) {
      var obj = {
        content: data.steps[index].content,
        element: data.steps[index].selector,
        placement: 'auto',
        title: 'Div ' + data.steps[index].id
      };

      if (data.steps[index].next == null) { // This is the last element.
        steps.push(obj);
      }
      else {
        steps[parseInt(data.steps[index].next) - 2] = obj; // Adding steps on basis of next parameter
      };

    });
    createTour(steps);
  }).fail(function (err) {
    console.log(err);
  });
})();

function createTour(steps) {
  var tour = new Tour({
    storage: false, // comment this if we don't want to start the tour after tour end.
    steps: steps
  });

  // Initialize the tour
  tour.init();

  // Start the tour
  tour.start();
}
