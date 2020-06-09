/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aspuser;

/**
 *
 * @author selin
 */
public class Tuple {
   
  public final int x; 
  public final int y; 
  public Tuple(int x, int y) { 
    this.x = x; 
    this.y = y; 
  
  }
  public String getx()
  {
      return Integer.toString(x);
  }
  
public String gety()
  {
      return Integer.toString(y);
  }
}
