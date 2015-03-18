$(document).ready(function() {
  Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'cbm_chart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: $('#cbm_chart').data('cbms'),
    //   { date_taken: '10/10/14', score: 20 },
    //   { date_taken: '11/10/14', score: 40 },
    //   { date_taken: '12/10/14', score: 45 },
    //   { date_taken: '1/10/15', score: 55 },
    //   { date_taken: '2/10/15', score: 60 }
    // ],
    // The name of the data record attribute that contains x-scores.
    xkey: 'date_taken',
    // A list of names of data record attributes that contain y-scores.
    ykeys: ['cbm'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['student']
  });

});
// $(document).ready(function() {
// Morris.Line({
//   element: 'cbm_chart',
//   data: [
//     { y: '2006', a: 100, b: 90 },
//     { y: '2007', a: 75,  b: 65 },
//     { y: '2008', a: 50,  b: 40 },
//     { y: '2009', a: 75,  b: 65 },
//     { y: '2010', a: 50,  b: 40 },
//     { y: '2011', a: 75,  b: 65 },
//     { y: '2012', a: 100, b: 90 }
//   ],
//   xkey: 'y',
//   ykeys: ['a', 'b'],
//   labels: ['Series A', 'Series B']
//   });
// });  

// // how do I connect it to my data?