def sudoku
  $arr = Array.new(9) { Array.new(9,0) }
	$arr[0]=(1..9).sort_by{rand}
	#$arr.each{|r| p r} if solve_sudoku == true
	puncture if solve_sudoku == true
	
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

def puncture
	arr = $arr
	71.times{arr[rand(9)][rand(9)]= 0}
  puts "Sudoku"
  arr.each{|r| p r}
  puts"wanna play this"
	puts"Press y-Yes  n-No"
	a=gets.chomp
	input(arr) if a == "y"
end
=begin
	
rescue Exception => e
	
end
def play
	arr=$arr
  arr.each_index do |row|
    arr[row].each_index do |col| 
 	    if arr[row][col]==0
 	    	puts"what you think should be at index #{[row]}#{[col]}"
 	    	num = gets.chomp
 	    	if is_safe(num,row,col)
 	    		arr[row][col] = num
 	    	else
 	    		arr[row][col]=0
 	    		p "no baby ! u are putting wrong digit"
 	    		return
 	      end
 	    end
 	  end
 	end
 	p" are u done with ??"
 	a= gets.chomp
 	compare(arr) if a == "yes"
end
=end
def compare(arr)
  p "You are genius dude" if arr == $arr
  p "require some more effort"
end

def input(arr)
	arr.each_index do |r|
	  while arr[r].include?(0)
	    p "enter the index of row and column"
	    row, col = gets.split.map(&:to_i)
	    p "enter the digit"
	    num = gets.chomp
	    if !is_safe(num,row,col)
 	      arr[row][col] = num
 	    else
 	      arr[row][col]=0
 	      p "u are putting wrong digit"
 	    end
    end
  end
  p" are u done with ??"
 	a= gets.chomp
 	compare(arr) if a == "yes"
end

sudoku