using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

public partial class SendMail : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings["cn"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.Count > 0)
            {
                string str = "";
                if (Request.QueryString["type"].ToString() == "stu")
                {
                    str = "select firstName+' '+lastName name, email,guardianEmail from tblStudent where admissionNo='" + Request.QueryString["no"].ToString() + "'";
                    //lblRecipient.Visible = true;
                    ddlRecipient.Enabled = true;
                }
                else
                {
                    str = "select firstName+' '+lastName name, email from tblStaff where EmployeeCode='" + Request.QueryString["no"].ToString() + "'";
                    //lblRecipient.Visible = false;
                    ddlRecipient.Enabled = false;
                }
                cn.Open();
                SqlDataAdapter da = new SqlDataAdapter(str, cn);
                DataSet ds = new DataSet();
                da.Fill(ds);
                cn.Close();

                txtToAddress.Text = ds.Tables[0].Rows[0]["email"].ToString();
                lblName.Text = ds.Tables[0].Rows[0]["name"].ToString();

                if (Request.QueryString["type"].ToString() == "stu")
                {
                    lblEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
                    lblGemail.Text = ds.Tables[0].Rows[0]["guardianEmail"].ToString();
                }
            }
        }
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            Mail.SendMail(txtToAddress.Text, txtSubject.Text, txtMessage.Text, lblName.Text);
            lblMessage.Text = "Mail has been sent.";
            txtMessage.Text = "";
            txtSubject.Text = "";
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Mail not sent due to server problem. Please try after some time.";
        }
    }

    protected void ddlRecipient_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlRecipient.SelectedIndex == 0)
        {
            txtToAddress.Text = lblEmail.Text;
        }
        else if (ddlRecipient.SelectedIndex == 0)
        {
            txtToAddress.Text = lblGemail.Text;
        }
        else
        {
            txtToAddress.Text = lblEmail.Text + ", " + lblGemail.Text;
        }
    }
}