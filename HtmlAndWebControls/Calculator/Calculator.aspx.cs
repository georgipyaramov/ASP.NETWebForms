namespace Calculator
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    public partial class Calculator : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.sqrtBtn.Text = Server.HtmlDecode("&radic;");
        }

        protected void digitBtn_Click(object sender, EventArgs e)
        {
            var buttonClicked = sender as Button;
            var digit = buttonClicked.Text;
            this.textBoxCalcDisplay.Text += digit;
        }

        protected void clearBtn_Click(object sender, EventArgs e)
        {
            this.textBoxCalcDisplay.Text = "";
        }

        protected void plusBtn_Click(object sender, EventArgs e)
        {
            this.textBoxCalcDisplay.Text += " + ";
        }

        protected void minusBtn_Click(object sender, EventArgs e)
        {
            this.textBoxCalcDisplay.Text += " - ";
        }

        protected void multiplyByBtn_Click(object sender, EventArgs e)
        {
            this.textBoxCalcDisplay.Text += " * ";
        }

        protected void devideByBtn_Click(object sender, EventArgs e)
        {
            this.textBoxCalcDisplay.Text += " / ";
        }

        protected void sqrtBtn_Click(object sender, EventArgs e)
        {
            this.textBoxCalcDisplay.Text += " " + Server.HtmlDecode("&radic;") + " ";
        }

        protected void equalsBtn_Click(object sender, EventArgs e)
        {
            var mathExpression = this.textBoxCalcDisplay.Text.Split(new string[] {" "}, StringSplitOptions.RemoveEmptyEntries);
            var numbers = new Queue<double>();
            var operations = new Queue<string>();
            double number = 0;

            for (int i = 0; i < mathExpression.Length; i++)
			{
                if (double.TryParse(mathExpression[i], out number))
	            {
                    numbers.Enqueue(number);
	            }
		        else
	            {
                    operations.Enqueue(mathExpression[i]);
	            }
			}

            var result = this.Solve(numbers, operations);

            this.textBoxCalcDisplay.Text = result.ToString();
        }

        private double Solve(Queue<double> numbers, Queue<string> operations)
        {
            double result = 0;
            double currentResult = numbers.Dequeue();

            while (operations.Count > 0)
            {
                var currentOperation = operations.Dequeue();

                if (currentOperation == "+")
                {
                    currentResult += numbers.Dequeue();
                }
                else if (currentOperation == "-")
                {
                    currentResult -= numbers.Dequeue();
                }
                else if (currentOperation == "*")
                {
                    currentResult *= numbers.Dequeue();
                }
                else if (currentOperation == "/")
                {
                    currentResult /= numbers.Dequeue();
                }
                else
                {
                    currentResult = Math.Sqrt(currentResult);
                }
            }

            result = currentResult;

            return result;
        }
    }
}