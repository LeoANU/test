package servlet;

import java.io.IOException;
import java.util.UUID;
import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.Statement;

import java.util.ArrayList;

import java.util.List;
import java.io.File;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.http.Part;


@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet{

    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
        try {
      
            Part part=request.getPart("file");
            String name=part.getHeader("content-disposition");
            String root=request.getServletContext().getRealPath("/upload");
            String fname=name.substring(name.lastIndexOf("\\")+1, name.length()-1); 
            String filename=root+"\\"+fname;
            part.write(filename);
        

            request.getRequestDispatcher("/interview.jsp?fname="+fname+"").forward(request, response);
		 	
        } catch (Exception e) {
            e.printStackTrace();
        }
        

		
    }
    
}