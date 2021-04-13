Option Explicit On
Option Strict On

#Region " Imports "

Imports System
Imports DevExpress.Data.Filtering
Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS
Imports Baca

#End Region

Partial Class Utility_Izin_HO_HORetribusiDaftarUlang
    Inherits System.Web.UI.Page
    Private session1 As New Session

#Region " Xpo "

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        XpoDataSourceHO.Session = session1
    End Sub

#End Region

#Region " HO "

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("HOID") = Nothing
        End If
        HORetriDetailsView.Visible = False
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim nopermohonan As String = searchNomerPermohonanASPxTextBox.Text
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & nopermohonan.ToString & "'")
        Dim objpermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objpermohonan IsNot Nothing Then
            If cekHO(objpermohonan) = True Then
                HORetriDetailsView.ChangeMode(DetailsViewMode.Edit)
                HORetriDetailsView.Visible = True
            End If
        End If
    End Sub

    Private Function cekHO(ByVal obj As Permohonan) As Boolean
        Dim query As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & obj.PermohonanID.ToString & "'")
        Dim objHO As HO = DirectCast(session1.FindObject(GetType(HO), query), HO)
        If objHO IsNot Nothing Then
            Session("HOID") = objHO.HOID
            Return True
        Else
            Session("HOID") = Nothing
            Return False
        End If
    End Function

    Protected Sub CetakButtonUlang_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles CetakButtonUlang.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim SkrdHOUlang As New SKRDDaftarUlangHO.Parameters(noPermohonan)
        SkrdHOUlang.OpenReportInNewWindow()
    End Sub

#End Region

#Region " Detail View "

    Protected Sub HORetriDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles HORetriDetailsView.DataBound
        If HORetriDetailsView.CurrentMode = DetailsViewMode.Edit Then
            Dim dv As DetailsView = HORetriDetailsView
            Dim crit As CriteriaOperator = CriteriaOperator.Parse("HOID='" & Session("HOID").ToString & "'")
            Dim textretri As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetribusiEdit"), ASPxTextBox)
            Dim hoid As HO = DirectCast(session1.FindObject(GetType(HO), crit), HO)
            If textretri IsNot Nothing Then
                textretri.Value = hoid.HOID
                textretri.Text = CStr(hoid.Retribusi)
            Else
                textretri = Nothing
            End If
        End If
    End Sub

    Protected Sub HORetriDetailsView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles HORetriDetailsView.ItemUpdated
        e.NewValues.Item("TerbilangDaftarUlang") = Session("TerbilangDaftarUlang")
        e.NewValues.Item("RetriDaftarUlang") = Session("RetriDaftarUlang")
        PopupSimpan.ShowOnPageLoad = True

    End Sub

    Protected Sub HORetriDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles HORetriDetailsView.ItemUpdating
        Dim bilang As New Baca
        Dim dv As DetailsView = HORetriDetailsView
        Dim persen As Double = 0.5
        Dim retribusi As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetribusiEdit"), ASPxTextBox)
        Dim retrDaftarUlang As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetriDaftarUlangEdit"), ASPxTextBox)
        Dim RIGdaftarulang As Double = CDbl(retribusi.Text) * persen
        retrDaftarUlang.Text = bilang.Terbilang(RIGdaftarulang.ToString)
        'e.NewValues.Item("RetriDaftarUlang") = RIGdaftarulang.ToString
        'e.NewValues.Item("TerbilangDaftarUlang") = retrDaftarUlang.Text

        Dim angkabelakang As Double = CDbl(Right(RIGdaftarulang.ToString, 2))
        If angkabelakang < 50 Then
            RIGdaftarulang = RIGdaftarulang - angkabelakang
        Else
            If angkabelakang > 50 And angkabelakang < 100 Then
                Dim penambahan As Double = 100 - angkabelakang
                RIGdaftarulang = RIGdaftarulang + angkabelakang
            End If
        End If
        e.NewValues.Item("RetriDaftarUlang") = RIGdaftarulang.ToString
        e.NewValues.Item("TerbilangDaftarUlang") = bilang.Terbilang(RIGdaftarulang.ToString)
    End Sub

    Protected Sub TextBoxRetriDaftarUlang_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dv As DetailsView = HORetriDetailsView
        Dim persen As Double = 0.5
        Dim retribusi As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetribusiEdit"), ASPxTextBox)
        Dim retrDaftarUlang As ASPxTextBox = DirectCast(dv.FindControl("TextBoxRetriDaftarUlangEdit"), ASPxTextBox)
        Dim RIGdaftarulang As Double = CDbl(retribusi.Text) * persen
        retrDaftarUlang.Text = RIGdaftarulang.ToString
    End Sub

#End Region

End Class
