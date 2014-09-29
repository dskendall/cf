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


	function Peak (name, elevation){
		for (i = 0; i < peakData.length; i++) {
			this.name = peakData[i][0];
			this.elevation = peakData[i][1];
			this.toHTML = function (){
			return '<li class = "peak">' + this.name + ': ' + this.elevation + ' ft </li>';
		};
			$('.peaks').append(this.toHTML());
		}
	}

	Peak();

//rework the sort, not working 
	function insertionSort() {
		var value, // the value currently being compared
			unsortedIndex, // index into unsorted section
			sortedIndex; // index into sorted section

		for (unsortedIndex = 0; unsortedIndex < peakData.length; unsortedIndex++) {
			// store the current value because it may shift later
			value = peakData[unsortedIndex][1];
			alert(value);
			/*
			* Whenever the value in the sorted section is greater than the value
			* in the unsorted section, shift all items in the sorted section over
			* by one. This creates space in which to insert the value.
			*/
			for (sortedIndex = unsortedIndex; sortedIndex > 0 && value < peakData[sortedIndex-1][1]; sortedIndex--)
				peakData[sortedIndex][1] = value;
		}

		return peakData;
	}
	
	insertionSort(peakData);
	document.write(peakData.join(" "));
	/*		return '<li class = "peak">' + this.name + ': ' + this.elevation + ' ft </li>';
		};
			
			/*
			$('.peaks').append(this.toHTML()); //add code for nth child selector?
			
	

	$('button').on('click', function() {
        insertionSort();
      });
*/
});
