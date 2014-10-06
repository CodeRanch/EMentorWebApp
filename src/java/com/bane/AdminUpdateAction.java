package com.bane;

import java.io.FileOutputStream;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class AdminUpdateAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)throws Exception
    {
        AdminUpdateBean bean = (AdminUpdateBean)form;
        
        //getting session and attribute
        HttpSession session = request.getSession();
        int userId = (Integer)session.getAttribute("userId");
        //done retrieving parameters
        
        boolean status=false;
        FormFile photo = bean.getPhoto();
        if(photo.getFileSize()==0){
            status = AdminDBManager.updateAdmin(userId,bean,null);
        }else{
            String fileName = getFileName(photo);

            status = AdminDBManager.updateAdmin(userId,bean,fileName);

            //To Save the file into a Folder

            String path = request.getServletContext().getRealPath("/")+"uploads/"+fileName;

            FileOutputStream fo = new FileOutputStream(path);
            fo.write(photo.getFileData());
            fo.close();
        }
        System.out.println("Status: "+status);
        if(status){
            session.setAttribute("profile_updated", "true");
            return mapping.findForward(SUCCESS);
        }
        else
            return mapping.findForward(FAILURE);
    }
    
    //method to generate random file name for uploaded photo
    private String getFileName(FormFile photo) {
        String fileName = photo.getFileName();
        String extName = fileName.substring(fileName.lastIndexOf("."));
        fileName = UUID.randomUUID()+extName;
        return fileName;
    }
}
