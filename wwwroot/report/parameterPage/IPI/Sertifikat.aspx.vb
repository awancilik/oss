﻿Option Explicit On
Option Strict On
Imports System
Partial Class report_parameterPage_IPI_Sertifikat
    Inherits System.Web.UI.Page

    Protected Sub CariASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CariASPxButton.Click
        Dim nopermohonan As String = NoPermohonanASPxTextbox.Text.Trim
        Dim rSertifikat As New IPISertifikat.Parameters(nopermohonan)
        rSertifikat.OpenReportInNewWindow()
    End Sub
End Class
