Option Explicit On
Option Strict On
Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS
Partial Class Utility_Izin_IPT_IPTRetribusi
    Inherits System.Web.UI.Page
    Dim session1 As Session
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        IPTXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

    Protected Sub searchASPxButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles searchASPxButton.Click
        Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text.Trim
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan = '" & noPermohonan & "'")
        Dim objPermohonan As Permohonan = DirectCast(session1.FindObject(GetType(Permohonan), criteria), Permohonan)
        If objPermohonan IsNot Nothing Then
            If CekIPT(objPermohonan) Then
                Session("PermohonanID") = objPermohonan.PermohonanID
                iptRetribusiDetailView.DataBind()
            Else
                Session("PermohonanID") = Nothing
                iptRetribusiDetailView.DataBind()
                notFoundASPxPopupControl.ShowOnPageLoad = True
            End If
        Else
            Session("PermohonanID") = Nothing
            iptRetribusiDetailView.DataBind()
            notFoundASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

    Private Function CekIPT(ByVal obj As Permohonan) As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & obj.PermohonanID.ToString & "'")
        Dim objIPT As IPT = DirectCast(session1.FindObject(GetType(IPT), criteria), IPT)
        If objIPT IsNot Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

    Protected Sub iptRetribusiDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles iptRetribusiDetailView.ItemUpdated
        e.NewValues.Item("RetribusiTerbilang") = Session("RetribusiTerbilang")
        'Dim dv As DetailsView = iptRetribusiDetailView
        'Dim hasil As ASPxLabel = DirectCast(dv.FindControl("ASPxLabelJumlahTotal"), ASPxLabel)
        'Dim luastanah As ASPxTextBox = DirectCast(dv.FindControl("LuasTanahTextBox"), ASPxTextBox)
        'Dim permeter As ASPxTextBox = DirectCast(dv.FindControl("PerMeterTextBox"), ASPxTextBox)
        'Dim jmltotal As ASPxTextBox = DirectCast(dv.FindControl("ASPxTextBoxJumlahTotal"), ASPxTextBox)
        'Dim totretri As Double = CDbl(luastanah.Text) * CDbl(permeter.Text)
        'jmltotal.Text = totretri.ToString
    End Sub

    Protected Sub iptRetribusiDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles iptRetribusiDetailView.ItemUpdating
        Dim bilang As New Baca
        Dim dv As DetailsView = iptRetribusiDetailView
        Dim luastanah As ASPxTextBox = DirectCast(dv.FindControl("LuasTanahTextBox"), ASPxTextBox)
        Dim permeter As ASPxTextBox = DirectCast(dv.FindControl("PerMeterTextBox"), ASPxTextBox)
        Dim jmltotal As ASPxTextBox = DirectCast(dv.FindControl("ASPxTextBoxJumlahTotal"), ASPxTextBox)
        Dim totretri As Double = CDbl(luastanah.Text) * CDbl(permeter.Text)
        jmltotal.Text = bilang.Terbilang(totretri.ToString)
        e.NewValues.Item("RetribusiTerbilang") = jmltotal.Text
        'Dim retribusi As Integer
        'Dim per As Integer
        'End If
        'Dim ret As Integer = 150 * retribusi
        'Dim angkabelakang As Integer = CInt(Right(ret.ToString, 2))
        'If angkabelakang < 50 Then
        '    retribusi = retribusi - angkabelakang
        'Else
        '    If angkabelakang > 50 And angkabelakang < 100 Then
        '        Dim penambahan As Integer = 100 - angkabelakang
        '        retribusi = retribusi + angkabelakang
        '    End If
        'End If
        'e.NewValues.Item("LuasTanah") = CDec(retribusi)
        'e.NewValues.Item("RetribusiTerbilang") = Terbilang.Terbilang(retribusi.ToString)
    End Sub

    'Protected Sub cetakSKRDIPTASPxButton_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    Dim noPermohonan As String = searchNomerPermohonanASPxTextBox.Text
    '    If Not String.IsNullOrEmpty(noPermohonan) Then
    '        Dim rSKRD As New SKRDIPT.Parameters(noPermohonan)
    '        rSKRD.OpenReportInNewWindow()
    '    End If
    'End Sub

    Protected Sub PerMeterTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'Dim bilang As New Baca
        Dim dv As DetailsView = iptRetribusiDetailView
        Dim luastanah As ASPxTextBox = DirectCast(dv.FindControl("LuasTanahTextBox"), ASPxTextBox)
        Dim permeter As ASPxTextBox = DirectCast(dv.FindControl("PerMeterTextBox"), ASPxTextBox)
        Dim jmltotal As ASPxTextBox = DirectCast(dv.FindControl("ASPxTextBoxJumlahTotal"), ASPxTextBox)
        Dim totretri As Double = CDbl(luastanah.Text) * CDbl(permeter.Text)
        jmltotal.Text = totretri.ToString
    End Sub

End Class
