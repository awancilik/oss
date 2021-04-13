Option Explicit On
Option Strict On
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Imports System

Partial Class report_parameterPage_Lokasi_JmlIzinLokasi
    Inherits System.Web.UI.Page
    Protected Sub CariButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariButton.Click
        Dim _startDate As Date = AwalCalendar.Date
        Dim _endDate As Date = AhkirCalendar.Date
        Dim LokasiJmlIzin As New JmlIzinLokasi.Parameters(_startDate, _endDate)
        LokasiJmlIzin.OpenReportInNewWindow()
    End Sub

End Class
