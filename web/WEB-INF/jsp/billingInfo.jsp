<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="shared/assets.jsp" />
  <title>Checkout</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div class="mainContentContainer">
  <h1>Checkout</h1>
  <form action="${pageContext.request.contextPath}/order/summary" method="POST" class="checkoutInfoForm">
  <div class="addressContainer">
    <div class="shippingInfoContainer">
      <h2>Shipping Information</h2>
      <ul class="noBullet">
          <li>
            <label for="shippingFirstName">First Name:</label>
            <span><input type="text" data-validate="required" name="shippingFirstName" class="text ui-widget-content ui-corner-all" id="shippingFirstName"/></span>
          </li>

          <li>
            <label for="shippingLastName">Last Name:</label>
            <span><input type="text" data-validate="required" name="shippingLastName" class="text ui-widget-content ui-corner-all" id="shippingLastName"/></span>
          </li>

          <li>
            <label for="shippingAddress1">Address 1:</label>
            <span><input type="text" data-validate="required" name="shippingAddress1" class="text ui-widget-content ui-corner-all" id="shippingAddress1"/></span>
          </li>

          <li>
            <label for="shippingAddress2">Address 2 (optional):</label>
            <span><input type="text" name="shippingAddress2" class="text ui-widget-content ui-corner-all" id="shippingAddress2"/></span>
          </li>

          <li>
            <label for="shippingCity">City:</label>
            <span><input type="text" data-validate="required" name="shippingCity" class="text ui-widget-content ui-corner-all" id="shippingCity"/></span>
          </li>

          <li>
            <label for="shippingState">State/Province:</label>
            <span>
              <select name="shippingState" data-validate="required" class="text ui-widget-content ui-corner-all" id="shippingState">
                <option value="">-- Select a state --</option>
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DE">Delaware</option>
                <option value="DC">District Of Columbia</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="IA">Iowa</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="ME">Maine</option>
                <option value="MD">Maryland</option>
                <option value="MA">Massachusetts</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MS">Mississippi</option>
                <option value="MO">Missouri</option>
                <option value="MT">Montana</option>
                <option value="NE">Nebraska</option>
                <option value="NV">Nevada</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NY">New York</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VT">Vermont</option>
                <option value="VA">Virginia</option>
                <option value="WA">Washington</option>
                <option value="WV">West Virginia</option>
                <option value="WI">Wisconsin</option>
                <option value="WY">Wyoming</option>
              </select>
            </span>
          </li>

          <li>
            <label for="shippingZip">Zip/Postal:</label>
            <span><input type="text" data-validate="required,zip" name="shippingZip" class="text ui-widget-content ui-corner-all" id="shippingZip"/></span>
          </li>

          <li>
            <label for="shippingPhone">Phone Number:</label>
            <span><input type="text" data-validate="required,phoneNumber" name="shippingPhone" class="text ui-widget-content ui-corner-all" id="shippingPhone" placeholder="1234567890"/></span>
          </li>

          <li>
            <input type="checkbox" name="billingSameAsShipping" class="billingSameAsShipping"/>
            <span>My billing information is the same</span>
          </li>
        </ul>
    </div>
    <div class="billingInfoContainer">
      <h2>Billing Information</h2>
      <ul class="noBullet">
          <li>
            <label for="billingFirstName">First Name:</label>
            <span><input type="text" data-validate="required" name="billingFirstName" class="text ui-widget-content ui-corner-all" id="billingFirstName"/></span>
          </li>

          <li>
            <label for="billingLastName">Last Name:</label>
            <span><input type="text" data-validate="required" name="billingLastName" class="text ui-widget-content ui-corner-all" id="billingLastName"/></span>
          </li>

          <li>
            <label for="billingAddress1">Address 1:</label>
            <span><input type="text" data-validate="required" name="billingAddress1" class="text ui-widget-content ui-corner-all" id="billingAddress1"/></span>
          </li>

          <li>
            <label for="billingAddress2">Address 2 (optional):</label>
            <span><input type="text" name="billingAddress2" class="text ui-widget-content ui-corner-all" id="billingAddress2"/></span>
          </li>

          <li>
            <label for="billingCity">City:</label>
            <span><input type="text" data-validate="required" name="billingCity" class="text ui-widget-content ui-corner-all" id="billingCity"/></span>
          </li>

          <li>
            <label for="billingState">State/Province:</label>
            <span>
              <select data-validate="required" name="billingState" class="text ui-widget-content ui-corner-all" id="billingState">
                <option value="">-- Select a state --</option>
                <option value="AL">Alabama</option>
                <option value="AK">Alaska</option>
                <option value="AZ">Arizona</option>
                <option value="AR">Arkansas</option>
                <option value="CA">California</option>
                <option value="CO">Colorado</option>
                <option value="CT">Connecticut</option>
                <option value="DE">Delaware</option>
                <option value="DC">District Of Columbia</option>
                <option value="FL">Florida</option>
                <option value="GA">Georgia</option>
                <option value="HI">Hawaii</option>
                <option value="ID">Idaho</option>
                <option value="IL">Illinois</option>
                <option value="IN">Indiana</option>
                <option value="IA">Iowa</option>
                <option value="KS">Kansas</option>
                <option value="KY">Kentucky</option>
                <option value="LA">Louisiana</option>
                <option value="ME">Maine</option>
                <option value="MD">Maryland</option>
                <option value="MA">Massachusetts</option>
                <option value="MI">Michigan</option>
                <option value="MN">Minnesota</option>
                <option value="MS">Mississippi</option>
                <option value="MO">Missouri</option>
                <option value="MT">Montana</option>
                <option value="NE">Nebraska</option>
                <option value="NV">Nevada</option>
                <option value="NH">New Hampshire</option>
                <option value="NJ">New Jersey</option>
                <option value="NM">New Mexico</option>
                <option value="NY">New York</option>
                <option value="NC">North Carolina</option>
                <option value="ND">North Dakota</option>
                <option value="OH">Ohio</option>
                <option value="OK">Oklahoma</option>
                <option value="OR">Oregon</option>
                <option value="PA">Pennsylvania</option>
                <option value="RI">Rhode Island</option>
                <option value="SC">South Carolina</option>
                <option value="SD">South Dakota</option>
                <option value="TN">Tennessee</option>
                <option value="TX">Texas</option>
                <option value="UT">Utah</option>
                <option value="VT">Vermont</option>
                <option value="VA">Virginia</option>
                <option value="WA">Washington</option>
                <option value="WV">West Virginia</option>
                <option value="WI">Wisconsin</option>
                <option value="WY">Wyoming</option>
              </select>
            </span>
          </li>

          <li>
            <label for="billingZip">Zip/Postal:</label>
            <span><input type="text" data-validate="required,zip" name="billingZip" class="text ui-widget-content ui-corner-all" id="billingZip"/></span>
          </li>

          <li>
            <label for="billingPhone">Phone Number:</label>
            <span><input type="text" data-validate="required,phoneNumber" name="billingPhone" class="text ui-widget-content ui-corner-all" id="billingPhone" placeholder="1234567890"/></span>
          </li>
        </ul>
    </div>
  </div>
  <div class="paymentInfoContainer">
    <fieldset>
      <legend><h2>Payment Information</h2></legend>
      <ul class="noBullet">
        <li>
          <label for="paymentCardType">Card Type:</label>
          <span>
            <select data-validate="required" name="paymentCardType" class="text ui-widget-content ui-corner-all" id="paymentCardType">
              <option value="Visa">Visa</option>
              <option value="MasterCard">Master Card</option>
              <option value="Amex">American Express</option>
              <option value="Discover">Discover</option>
            </select>
          </span>
        </li>

        <li>
          <label for="paymentCardNumber">Card Number:</label>
          <span><input type="text" data-validate="required,cardNumber" name="paymentCardNumber" class="text ui-widget-content ui-corner-all" id="paymentCardNumber"/></span>
        </li>

        <li>
          <label>Expires:</label>
          <span>
            <select data-validate="required" name="paymentCardExpireMonth" class="text ui-widget-content ui-corner-all expirationDate">
              <option value="">Month</option>
              <option value="1">January</option>
              <option value="2">Feburary</option>
              <option value="3">March</option>
              <option value="4">April</option>
              <option value="5">May</option>
              <option value="6">June</option>
              <option value="7">July</option>
              <option value="8">Auguest</option>
              <option value="9">September</option>
              <option value="10">October</option>
              <option value="11">November</option>
              <option value="12">December</option>
          </select>
          </span>
          <span>
            <select data-validate="required" name="paymentCardExpireYear" class="text ui-widget-content ui-corner-all expirationDate">
              <option value="">Year</option>
              <option value="2014">2014</option>
              <option value="2015">2015</option>
              <option value="2016">2016</option>
              <option value="2017">2017</option>
              <option value="2018">2018</option>
              <option value="2019">2019</option>
              <option value="2020">2020</option>
              <option value="2021">2021</option>
              <option value="2022">2022</option>
              <option value="2023">2023</option>
            </select>
          </span>
        </li>

        <li>
          <label for="paymentCardCSV">Security Code:</label>
          <span><input type="password" data-validate="required,csv" name="paymentCardCSV" class="text ui-widget-content ui-corner-all" id="paymentCardCSV"/></span>
        </li>
      </ul>
    </fieldset>
  </div>

  <div class="checkoutAction">
    <button class="editCart">Edit Cart</button>
    <button class="submitOrder">View Order Summary</button>
  </div>

  </form>

</div>
</body>
</html>
