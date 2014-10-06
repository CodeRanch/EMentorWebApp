package com.bane;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author Anurag
 */
public class UpdateFormBean extends org.apache.struts.action.ActionForm {

    private String passwd;
    private String passwd2;
    private String email;
    private String mobileNumber;
    private FormFile photo;
    private String college;
    private String courseId;
    private String coursename;

    /**
     *
     */
    public UpdateFormBean() {
        super();
        // TODO Auto-generated constructor stub
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

    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        
        if (errors.isEmpty() || errors.size() == 0) {

            if (passwd == null || passwd.length() == 0) {
                errors.add("pass", new ActionMessage("error.register.passwd.required"));
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
            if (errors.isEmpty() || errors.size() == 0) {
                /*if(!Pattern.matches("\\d{4}", uname)){
                 errors.add("uname", new ActionMessage("error.register.uname.invalid"));
                 }*/
                if (passwd.length() < 6) {
                    errors.add("pass", new ActionMessage("error.register.passwd.invalid"));
                }
                if(!mobileNumber.matches("\\d{10}")){
                        errors.add("mno", new ActionMessage("error.register.mobileNumber.invalid"));
                }
                if (!passwd.equals(passwd2)) {
                    errors.add("pass2", new ActionMessage("error.register.passwd.match"));
                }
                if (photo.getFileSize() != 0) {
                    if (!photo.getContentType().equals("image/jpeg") && !photo.getContentType().equals("image/png")) {
                        errors.add("pic", new ActionMessage("error.register.photo.filetype"));
                    }
                }
            }
        }
        return errors;
    }
}
