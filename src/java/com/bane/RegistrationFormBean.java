package com.bane;

//import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

public class RegistrationFormBean extends org.apache.struts.action.ActionForm {
    
    private String uname;
    private String passwd;
    private String passwd2;
    private String name;
    private String email;
    private String mobileNumber;
    private FormFile photo;
    private String college;
    private String courseId;
    private String coursename;
            
    public RegistrationFormBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    public RegistrationFormBean(String uname, String passwd, String passwd2, String name, String email, String mobileNumber, FormFile photo, String college, String courseId, String coursename) {
        this.uname = uname;
        this.passwd = passwd;
        this.passwd2 = passwd2;
        this.name = name;
        this.email = email;
        this.mobileNumber = mobileNumber;
        this.photo = photo;
        this.college = college;
        this.courseId = courseId;
        this.coursename = coursename;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public String getPasswd2() {
        return passwd2;
    }

    public void setPasswd2(String passwd2) {
        this.passwd2 = passwd2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public FormFile getPhoto() {
        return photo;
    }

    public void setPhoto(FormFile photo) {
        this.photo = photo;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename;
    }

    /**
     *
     * @param mapping
     * @param request
     * @return
     */
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        
        ActionErrors errors = new ActionErrors();
        if(uname.length()>0 && DBManager.doesUnameExist(uname)){
            errors.add("username", new ActionMessage("error.register.uname.duplicate"));
        }
        if(errors.isEmpty() || errors.size()==0){
            
            if (uname == null || uname.length() == 0) {
                errors.add("username", new ActionMessage("error.register.uname.required"));
            }
            if (passwd == null || passwd.length() == 0) {
                errors.add("pass", new ActionMessage("error.register.passwd.required"));
            }
            if (name == null || name.length() == 0) {
                errors.add("fullname", new ActionMessage("error.register.name.required"));
            }
            if (email == null || email.length() == 0) {
                errors.add("emailid", new ActionMessage("error.register.email.required"));
            }
            if (mobileNumber == null || mobileNumber.length() == 0) {
                errors.add("mno", new ActionMessage("error.register.mobileNumber.required"));
            }
            if (college == null || college.length() == 0) {
                errors.add("colg", new ActionMessage("error.register.college.required"));
            }
            if(errors.isEmpty() || errors.size()==0){
                /*if(!Pattern.matches("\\d{4}", uname)){
                    errors.add("uname", new ActionMessage("error.register.uname.invalid"));
                }*/
                if(!uname.matches("[a-z]+")){
                    errors.add("username", new ActionMessage("error.register.uname.invalid"));
                }
                if(!mobileNumber.matches("\\d{10}")){
                        errors.add("mno", new ActionMessage("error.register.mobileNumber.invalid"));
                }
                if (passwd.length() < 6) {
                    errors.add("pass", new ActionMessage("error.register.passwd.invalid"));
                }
                if (!passwd.equals(passwd2)) {
                    errors.add("pass2", new ActionMessage("error.register.passwd.match"));
                }
                if(photo.getFileSize()!=0){
                    if (!photo.getContentType().equals("image/jpeg") && !photo.getContentType().equals("image/png")) {
                        errors.add("pic", new ActionMessage("error.register.photo.filetype"));
                    }
                }
            }
        }
        
        return errors;
    }
}
