$(function() {

// peak data from csv format for Isle of Man
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


	function Peak (elevation, name){
		for (i = 0; i < peakData.length; i++) {
			this.name = peakData[i][0];
			this.elevation = peakData[i][1];
			this.toHTML = function (){
			return '<li class = "peak">' + this.name + ': ' + this.elevation + ' ft </li>';
		};
			$('.peaks').append(this.toHTML());
		}
	}

	Peak(); // call Peak to generate peaks in DOM



	$('button').on('click', function() {
		insertionSort()
		.hide();

	});


// based on insertion sort code example at http://www.joshskeen.com/posts/view/39/javascript-insertion-sort-algorithm
	function insertionSort() {
		//var $m;

		for (var i = 1; i < peakData.length; i++){
			var value = peakData[i][1];
			var nameval = peakData[i][0];
			var done = false;
			j = i - 1;
			
			while (!done) {
				if (peakData[j][1] < value) {
					
					

					//peakData[j + 1][0] = peakData[j][0];  //swap #1, move the small # down a spot
					peakData[j + 1][1] = peakData[j][1];  //swap #1, move the small # down a spot
					peakData[j + 1][0] = peakData[j][0];

					//smallName = peakData[j][0];
					smallElev = peakData[j][1];
					smallName = peakData[j][0];

					$('.peak:eq(' + (j + 1) + ')')  //swap directly in the DOM
						.html(smallName + ": " + smallElev + ' ft')
						.addClass('swapping');



					j = j - 1;
					if (j < 0) {
						done = true;
					}
				} else {
					done = true;
				}
			}

		//$big = value;
		//bigName = peakData[j + 1][0]; //swap #2, set index j+1 value to index i value
		//peakData[j + 1][0] = name; //swap #2, set index j+1 value to index i value
		
		
		peakData[j + 1][1] = value; //swap #2, set index j+1 value to index i value
		peakData[j + 1][0] = nameval;
		$('.peak:eq(' + (j + 1) + ')')
			.html(nameval + ': ' + value + ' ft')  //swap directly in the DOM
			.addClass('swapping');

		}
		console.log(peakData);
	}

});