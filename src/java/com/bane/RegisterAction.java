package com.bane;

import java.io.FileOutputStream;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

public class RegisterAction extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private static final String FAILURE = "failure";

    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        RegistrationFormBean bean = (RegistrationFormBean)form;
        
        String uname = bean.getUname();
//        if(DBManager.doesUnameExist(uname)){
//            ActionErrors errors = new ActionErrors();
//            errors.add("username", new ActionMessage("error.register.uname.duplicate"));
//            
//            saveErrors(request, errors);
//            return mapping.getInputForward();
//        }
        boolean status=false;
        FormFile photo = bean.getPhoto();
        if(photo.getFileSize()==0){
            status = DBManager.addUser(bean,null);
        }else{
            String fileName = getFileName(photo);

            status = DBManager.addUser(bean,fileName);

            //To Save the file into a Folder

            String path = request.getServletContext().getRealPath("/")+"/uploads/"+fileName;

            FileOutputStream fo = new FileOutputStream(path);
            fo.write(photo.getFileData());
            fo.close();
        }
        System.out.println("Status: "+status);
        if(status)
            return mapping.findForward(SUCCESS);
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