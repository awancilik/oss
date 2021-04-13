Option Explicit On
Option Strict On
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports System

Partial Class report_parameterPage_IUI_JmlIUI
    Inherits System.Web.UI.Page

    Protected Sub CariButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariButton.Click
        Dim _startDate As Date = AwalCalendar.Date
        Dim _endDate As Date = AhkirCalendar.Date
        Dim JmlIzinUI As New JmlIUI.Parameters(_startDate, _endDate)
        JmlIzinUI.OpenReportInNewWindow()
    End Sub

End Class
