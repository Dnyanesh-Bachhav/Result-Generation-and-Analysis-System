
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import javax.swing.JFrame;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author DELL
 */
public class input {

    public static void main(String[] args) {
        game obj = new game();
    }

}

class game extends JFrame {

    public game() {
        super("T-rex Game");
        setVisible(true);
        setSize(800, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }
    public void paint(Graphics g)
    {
        BufferedImage img = null;
        
    }
}
