$.getJSON("static/guide.json", function(data) {
    var jsonArr = []
    $.each(data.steps, function( index) {
      jsonArr.push({
        content: data.steps[index].content,
        element: data.steps[index].selector,
        placement:'auto',
        title: 'Div ' + data.steps[index].id
        });
    });
    createTour(jsonArr)
  }).fail(function(err) {
    console.log(err);
  });

function createTour(steps){
    var tour = new Tour({
        storage: false, // comment this if we don't want to start the tour after tour end.
    steps: steps});

    // Initialize the tour
    tour.init();

    // Start the tour
    tour.start();
}
