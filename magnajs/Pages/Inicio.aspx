<%@ Page Title="" Language="C#" MasterPageFile="~/includes/magnajs.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="magnajs.Pages.Inicio" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <div class="view dashboard" ng-if="ctrl.currentView === 'Dashboard'" ng-controller="DashboardController as ctrl">
      <h1>Dashboard</h1>

       
      <div class="summary-boxes" layout="row" layout-align="space-between center">
        <div class="summary-box summary-total">
          <div class="summary-box-main">
            <div class="summary-value">134</div>
            <div class="summary-desc">Total orders</div>
          </div>
          <div class="summary-box-footer">
            View all <i class="fa fa-arrow-circle-right"></i>
          </div>
        </div>

        <div class="summary-box summary-pending">
          <div class="summary-box-main">
            <div class="summary-value">7</div>
            <div class="summary-desc">Pending orders</div>
          </div>
          <div class="summary-box-footer">
            View all <i class="fa fa-arrow-circle-right"></i>
          </div>
        </div>

        <div class="summary-box summary-amount">
          <div class="summary-box-main">
            <div class="summary-value">23 570,00 €</div>
            <div class="summary-desc">Total sold</div>
          </div>
          <div class="summary-box-footer">
            View all <i class="fa fa-arrow-circle-right"></i>
          </div>
        </div>
      </div>

      <div class="md-whiteframe-1dp">
        <h2>Announcements</h2>      
      </div>
    </div>


</asp:Content>

