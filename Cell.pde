class Cell {
  // instance fields
  public int col;
  public int row;
  
  private boolean amAlive = false;  // cell starts dead by default
  private int neighbors = 0;        // neighbors yet to be counted
  private final color DEAD_COLOR = color(#E8E8E8);
  private final color ALIVE_COLOR = color(#FF6600);
  
  // constructor
  public Cell(int row, int col) {
    this.col = col;
    this.row = row;
  }
  
  // methods
  public void toggleAlive() { amAlive = !amAlive; }
  public void setAlive(boolean alive) { amAlive = alive; }
  public boolean isAlive() { return amAlive; }
  
  public void display(int xoffset, int yoffset, int w, int h) {
    xoffset += (w+1) * col;
    yoffset += (h+1) * row;
    color fillColor = amAlive ? ALIVE_COLOR : DEAD_COLOR;
    fill(fillColor);
    rect(xoffset, yoffset, w, h);
  }
    
  // Set this cell to alive or dead based on current state
  // of amAlive and the number of live neighbors
  public void updateAlive() {
    // Try to figure out an expression using Boolean operator(s) such
    // as && and || along with neighbor count and current alive/dead state
    // to solve this without using if/else
    if (amAlive && (neighbors == 2 || neighbors == 3));
    else if (!amAlive && neighbors == 3) toggleAlive();
    else if (amAlive) toggleAlive();
  }
  
  // Compute the number of live neighbors for this cell 
  // and return that number
  public int calculateNeighbors() {
    neighbors = 0; 
    int[] dirs = { -1, 0, 1 };
     for (int xd : dirs)
     	for (int yd : dirs)
     		if (!(xd == 0 && yd == 0) && col+xd >= 0 && col+xd < cell[row].length && row+yd >= 0 && row+yd < cell.length && cell[row+yd][col+xd].isAlive())
     			neighbors++;
     
     if (neighbors > 0) System.out.println("alive: " + amAlive + " row: " + row + " column: " + col + " neighbors: " + neighbors);
     return neighbors;
  }
}
