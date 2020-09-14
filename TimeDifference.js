function TimeDifference(strArr) {

  let listOfMinuts = [];

  // sort 
  strArr.sort(function (a, b) {
    return new Date('1970/01/01 ' + a) - new Date('1970/01/01 ' + b);
  });

  console.log(strArr)

  // transform to minuts
  strArr.forEach(t => {
    var part = t.match(/(\d+):(\d+)(?: )?(am|pm)?/i);
    var hh = parseInt(part[1], 10);
    var mm = parseInt(part[2], 10);
    listOfMinuts.push(hh * 60 + mm)
  });

  // all times in minutes order asc
  listOfMinuts.sort(function (a, b) {
    return a - b;
  });

  // get min difference array
  function getMinDifference(A) {
    return A.slice(1).map(function (n, i) {
      return n - A[i];
    });
  }

  // get nmin value
  function getMin(data) {
    return data.reduce(function (r, e, i) {
      let absR = Math.abs(r), absE = Math.abs(e);
      if (absR > absE || i == 0 || (absR == absE && e > r))
        r = e
      return r
    })
  }

  return getMin(getMinDifference(listOfMinuts))
}

TimeDifference(["10:00am", "11:45pm", "5:00am", "12:01am"]);