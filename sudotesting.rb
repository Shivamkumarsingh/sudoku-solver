def sudoku
  $arr = Array.new(9) { Array.new(9,0) }
	$arr[0]=(1..9).sort_by{rand}
	$arr.each{|r| p r} if solve_sudoku == true
end

def solve_sudoku
	row, col = find_unassigned_cell
  return true unless row and col
  (1..9).each do |num|
	  if(is_safe(num, row, col))
	    $arr[row][col] = num 
		  return true if solve_sudoku
		  $arr[row][col] = 0
		end
	end
	false
end

def find_unassigned_cell 
	index_collector=[]
	$arr.each_index{ |row| $arr[row].each_index{ |col| return index_collector=[row,col] if $arr[row][col] == 0}}
	return index_collector
end

def col_check(num, col)
	$arr.transpose[col].include?(num)
end

def row_check(num, row)
	$arr[row].include?(num)
end

def box_check(srow, scol, num)	
  for r in (0..2)
    for c in(0..2)
  		return true if $arr[r+srow][c+scol] == num
  	end
  end
  false
end

def is_safe(num, row, col)
	!row_check(num, row) && !col_check(num, col) && !box_check(row - row%3, col - col%3, num)
end

sudoku