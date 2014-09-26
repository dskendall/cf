$(function() {

	peakData = [
		["Beinn Rein", 1804],
		["Beinn-y-Phott", 1785],
		["Bradda Hill", 764],
		["Carraghan", 1640],
		["Clagh Ouyr", 1808],
		["Colden", 1598],
		["Cronk ny Arrey Laa", 1440],
		["Mount Karrin", 878],
		["Mull Hill", 554],
		["North Barrule", 1854],
		["Slieau Freoaghane", 1601],
		["Slieau Whallian", 1093],
		["Slieu Lhost", 1459],
		["Snaefell", 2036],
		["South Barrule", 1585]
		];


	function Peak (name, elevation){
		for (i = 0; i < 15; i++) {
			this.name = peakData[i][0];
			this.elevation = peakData[i][1];
			this.toHTML = function (){
			return '<li class = "peak">' + this.name + ': ' + this.elevation + ' ft </li>';
		};
			$('.peaks').append(this.toHTML());
		}
	}

	Peak();

/* rework the sort, not working */
	function sort() {
		var len = peakData.length, // number of items in the array
			value, // the value currently being compared
			i, // index into unsorted section
			j; // index into sorted section

		for (i = 0; i < len; i++) {
			// store the current value because it may shift later
			value = peakData[i][1];
			/*
			* Whenever the value in the sorted section is greater than the value
			* in the unsorted section, shift all items in the sorted section over
			* by one. This creates space in which to insert the value.
			*/
			for (j = i - 1; j > -1 && peakData[j] > value; j--) {
				peakData[j + 1] = peakData[j];
			}
		peakData[j + 1][1] = value;
		}
		return peakData;
	}

	$('button').on('click', function() {
        sort($(".peak").length - 1);
      });

});
