Imports DevExpress.Xpo
Imports Bisnisobjek.OSS
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering

Partial Class Utility_Izin_LokasiPembayaran
    Inherits System.Web.UI.Page

    Dim session1 As Session = Nothing

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        RekeningDataSource.Session = session1
        RetribusiListDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Session("Lokasiid.LokasiID") = ""
        RetribusiListDataSource.CriteriaParameters.Item(0).DefaultValue = ""

        Dim izin As New XPCollection(Of JenisIzin)(session1)
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If Not objPermohonan Is Nothing Then
            For Each detail As PermohonanDetail In objPermohonan.PermohonanDetail
                For Each item As JenisIzin In izin
                    If item.JenisIzinID = detail.JenisIzinID.JenisIzinID Then
                        If item.JenisIzinNama = "Lokasi" Then
                            Session("Lokasiid.LokasiID") = detail.PermohonanIzinID
                            RetribusiListDataSource.CriteriaParameters.Item(0).DefaultValue = detail.PermohonanIzinID.ToString
                        End If
                    End If
                Next
            Next
        Else
            MessageLabel.Text = "PERMOHONAN TIDAK DITEMUKAN !"
        End If
        RetribusiGridView.DataBind()
    End Sub

    Protected Sub CetakSKRD_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles SKRDButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text
        Dim rSKRD As New SKRDlokasi.Parameters(noPermohonan)
        rSKRD.OpenReportInNewWindow()
    End Sub

End Class
