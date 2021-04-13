Option Explicit On
Option Strict On
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports System

Partial Class report_IMBJmlIzin
    Inherits System.Web.UI.Page

    Protected Sub CariButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariButton.Click
        Dim _startDate As Date = AwalCalendar.Date
        Dim _endDate As Date = AhkirCalendar.Date
        Dim IMBJmlIzin As New IMBJmlIzinReport.Parameters(_startDate, _endDate)
        IMBJmlIzin.OpenReportInNewWindow()
    End Sub
End Class
