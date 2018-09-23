using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace InterestCalculator
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public void fundList_SelectedIndexChanged(object sender, EventArgs e)
        {

            foreach (ListItem item in fundList.Items)
            {
                if ((item.Selected == true) && (item.Value == "Fund 1"))
                {
                    fundSelected.Text = "You have selected " + item.Value + " - European Index Trust - The objective of this fund is to provide growth by tracking the performance of the FTSE World Europe ex UK Index. Invest in leading companies including healthcare, financial services, telecommunication and manufacturing. Risk - level = 5 / 7";
                    fundSelected.ForeColor = System.Drawing.Color.White;
                    Double.Parse(fundRate.Text = "12.5");
                    Chart2.Visible = false;
                    Chart3.Visible = false;
                    Chart4.Visible = false;
                    Chart5.Visible = false;
                }
                else if ((item.Selected == true) && (item.Value == "Fund 2"))
                {
                    fundSelected.Text = "You have selected " + item.Value + " - Global 100 Index Trust - Tracks the S & P Global 100 Index and invests in the largest 100 multinational blue - chip companies in the global stock markets. Gain exposure to the largest 100 multi - national blue - chip companies in the global market. Invest in companies including healthcare, financial services, telecommunications and manufacturing. Provides you with exposure to the global stock markets without the risks of individual stock selection. Risk - level = 4 / 7";
                    fundSelected.ForeColor = System.Drawing.Color.White;
                    Double.Parse(fundRate.Text = "10");
                    Chart1.Visible = false;
                    Chart3.Visible = false;
                    Chart4.Visible = false;
                    Chart5.Visible = false;
                }
                else if ((item.Selected == true) && (item.Value == "Fund 3"))
                {
                    fundSelected.Text = "You have selected " + item.Value + " - Asian Income Trust - Invests in the Far East in Asian(excluding Japan) and Australasian companies and gives you the potential for a regular income and some growth. Risk = 5 / 7";
                    fundSelected.ForeColor = System.Drawing.Color.White;
                    Double.Parse(fundRate.Text = "6.5");
                    Chart1.Visible = false;
                    Chart2.Visible = false;
                    Chart4.Visible = false;
                    Chart5.Visible = false;
                }
                else if ((item.Selected == true) && (item.Value == "Fund 4"))
                {
                    fundSelected.Text = "You have selected " + item.Value + " - Ethical Trust - Invests in FTSE 350 Index companies selected according to ethical and environmental guidelines meeting Ethical Investment Research Services (EIRIS) criteria. This filters out companies significantly involved in water pollution, intensive farming, gambling, adult entertainment, weapons manufacturing and tobacco sales. Risk – 5 / 7";
                    fundSelected.ForeColor = System.Drawing.Color.White;
                    Double.Parse(fundRate.Text = "7");
                    Chart1.Visible = false;
                    Chart2.Visible = false;
                    Chart3.Visible = false;
                    Chart5.Visible = false;
                }
                else if ((item.Selected == true) && (item.Value == "Fund 5"))
                {
                    fundSelected.Text = "You have selected " + item.Value + " - International Index Trust - Provides the potential for capital growth by tracking the performance of the FTSE World ex UK Index. Invest in companies including healthcare, financial services, telecommunications and manufacturing. Provides you with exposure to global stock markets without the risks of individual stock selection. Risk = 5 / 7 ";
                    fundSelected.ForeColor = System.Drawing.Color.White;
                    Double.Parse(fundRate.Text = "11");
                    Chart1.Visible = false;
                    Chart2.Visible = false;
                    Chart3.Visible = false;
                    Chart4.Visible = false;
                }
                else if ((item.Selected == false) && (item.Value == "No Fund"))
                {
                    fundSelected.Text = "Please pick a fund from the options.";
                    fundSelected.ForeColor = System.Drawing.Color.White;
                }
            }
        }

        public void principal_TextChanged(object sender, EventArgs e)
        {
            Convert.ToDouble(principal.Text);
        }

        public void monthlyDeposit_TextChanged(object sender, EventArgs e)
        {
            Convert.ToDouble(monthlyDeposit.Text);
        }

        public void duration_TextChanged(object sender, EventArgs e)
        {
            Convert.ToDouble(duration.Text);
        }

        public void Button1_Click(object sender, EventArgs e)
        {
            Chart1.Visible = false;
            Chart2.Visible = false;
            Chart3.Visible = false;
            Chart4.Visible = false;
            Chart5.Visible = false;
            fundSelected.Visible = false;

            double p = Convert.ToDouble(principal.Text);
            double r = Convert.ToDouble(fundRate.Text) / 100;
            double t = Convert.ToDouble(duration.Text);
            double n = 12;
            double pmt = Convert.ToDouble(monthlyDeposit.Text);

            // calculating the annual compound interest - this is correct!
            double a = p * (double)Math.Pow((double)(1 + r / n), n * t);
            double annually = Math.Round(a, 2);

            //Now let's calculate the monthly desposit compound interest, also correct!
            double a2 = pmt * ((double)Math.Pow((double)(1 + r / n), n * t) - 1) / (r / n);
            double monthly = Math.Round(a2, 2);

            //now calculating the total, annual compound interest plus the monthly deposit compounded interest
            double finalResult = annually + monthly;

            //share answer to stack overflow
            
            calculate.Text = "The estimated return on your investment is: £" + finalResult;
            calculate.ForeColor = System.Drawing.Color.White;
        }

        protected void Chart1_Load(object sender, EventArgs e)
        {
        }

        // draft - rendering chart on button click


    }
}