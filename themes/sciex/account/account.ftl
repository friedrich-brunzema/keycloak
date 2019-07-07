<#import "template.ftl" as layout>
<@layout.mainLayout active='account' bodyClass='user'; section>

   <div class="container" style="padding-top: 175px">
    <div class="row" style="margin-top: 25px">
      <div class="col-lg-8 col-lg-offset-2 col-sm-8 col-sm-offset-2">
        <div class="well bs-component" style="background-color: #004964;margin-bottom: 0px; color: white;">
          <h4 style="color: white">Update Profile</h4>
        </div>
        <div class="well bs-component">
          <div class="row">
            <div class="col-md-12">
                <form  action="${url.accountUrl}" class="form-horizontal" method="post">
                    <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
                    <div class="form-group">
                        <div class="col-lg-12">
                            <input type="text" name="firstName" class="form-control" id="COS-UpdateProfileDialog-firstNameField" placeholder="First name"  value="${(account.firstName!'')}"/>
                        </div>
                    </div>

                     <div class="form-group">
                        <div class="col-lg-12">
                            <input type="text" name="lastName" class="form-control" id="COS-UpdateProfileDialog-lastNameField" placeholder="Last name" value="${(account.lastName!'')}"/>
                        </div>
                    </div>

                    <#--  <div class="form-group">
                        <div class="col-lg-12">
                            <input type="text" name="username" id="username" placeholder="Username" value="${(account.username!'')}"/>
                        </div>
                    </div>  -->

                    <div class="form-group">
                        <div class="col-lg-12">
                            <input type="text" class="form-control" name="email" id="COS-UpdateProfileDialog-emailField" placeholder="Email" value="${(account.email!'')}"/>
                        </div>
                    </div>
                    <div class="form-group">
                    <div class="col-lg-12">
                        <button type="submit" class="btn btn-material-green-500" id="COS-UpdateProfileDialog-saveBtn">Save</button>
                        <a  class="btn btn-material-white-500" href="${properties.dashboardLink}" id="COS-UpdateProfileDialog-cancelBtn">Cancel</a>
                    </div>
                    </div>
                </form>
            </div>
          </div>
          <div class="row" style="border-top: 1px solid #ccc;margin-top: 20px; padding-top: 10px">
            <div class="col-md-6">

              <a href="http://www.sciex.com">
                <img src="${url.resourcesPath}/img/logo.png" alt="logo">
              </a>
            </div>
            <div class="bottom-align-text col-md-6" style="text-align: right; color: #bbb; padding-top: 20px">
              Copyright ©
            </div>
          </div>
        </div>
      </div>
    </div>
</div>


</@layout.mainLayout>