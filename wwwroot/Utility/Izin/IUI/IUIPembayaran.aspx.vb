Option Explicit On
Option Strict On

Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxEditors
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_IUI_IUIPembayaran
    Inherits System.Web.UI.Page
    Dim session1 As Session

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("PermohonanID") = Nothing
            Session("IUIID") = Nothing
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        iuiXpoDataSource.Session = session1
        rekeningXpoDataSource.Session = session1
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
            If CheckIUI(objPermohonan) Then
                Session("PermohonanID") = objPermohonan.PermohonanID
                iuiPembayaranDetailsView.DataBind()
            Else
                Session("PermohonanID") = Nothing
                iuiPembayaranDetailsView.DataBind()
                notFoundASPxPopupControl.ShowOnPageLoad = True
            End If
        Else
            Session("PermohonanID") = Nothing
            iuiPembayaranDetailsView.DataBind()
            notFoundASPxPopupControl.ShowOnPageLoad = True
        End If
    End Sub

    Private Function CheckIUI(ByVal obj As Permohonan) As Boolean
        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & obj.PermohonanID.ToString & "'")
        Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), criteria), IUI)
        If objIUI IsNot Nothing Then
            Return True
        Else
            Return False
        End If
    End Function

    Public Function Terbilang(ByVal strAngka As String) As String
        Dim strJmlHuruf, intPecahan As Integer, strPecahan$, Urai$, Bil1$, strTot$, Bil2$
        Dim X, y, z As Integer
        If strAngka = "" Then Exit Function
        strJmlHuruf = CInt(LTrim(strAngka))
        intPecahan = CInt(Val(Right(Mid(strAngka, 15, 2), 2)))
        If (intPecahan = 0) Then
            strPecahan = ""
        Else
            strPecahan = LTrim(Str(intPecahan)) + "/100 "
        End If

        X = 0
        y = 0
        Urai = ""

        While (X < strJmlHuruf.ToString.Length)
            X = X + 1
            strTot = Mid(CStr(strJmlHuruf), X, 1)
            y = CInt(y + Val(strTot))
            z = strJmlHuruf.ToString.Length - X + 1
            Select Case Val(strTot)
                Case 1
                    If (z = 1 Or z = 7 Or z = 10 Or z = 13) Then
                        Bil1 = "Satu "
                    ElseIf (z = 4) Then
                        If (X = 1) Then
                            Bil1 = "Se"
                        Else
                            Bil1 = "SATU "
                        End If
                    ElseIf (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                        X = X + 1
                        strTot = Mid(CStr(strJmlHuruf), X, 1)
                        z = strJmlHuruf.ToString.Length - X + 1
                        Bil2 = ""
                        Select Case Val(strTot)
                            Case 0
                                Bil1 = "Sepuluh "
                            Case 1
                                Bil1 = "Sebelsa "
                            Case 2
                                Bil1 = "Dua belas "
                            Case 3
                                Bil1 = "Tiga belas "
                            Case 4
                                Bil1 = "Empat belas "
                            Case 5
                                Bil1 = "Lima belas "
                            Case 6
                                Bil1 = "Enam belas "
                            Case 7
                                Bil1 = "Tujuh belas "
                            Case 8
                                Bil1 = "Delapan belas "
                            Case 9
                                Bil1 = "Sembilan belas "
                        End Select
                    Else
                        Bil1 = "Se"
                    End If
                Case 2
                    Bil1 = "Dua "
                Case 3
                    Bil1 = "Tiga "
                Case 4
                    Bil1 = "Empat "
                Case 5
                    Bil1 = "Lima "
                Case 6
                    Bil1 = "Enam "
                Case 7
                    Bil1 = "Tujuh "
                Case 8
                    Bil1 = "Delapan "
                Case 9
                    Bil1 = "Sembilan "
                Case Else
                    Bil1 = ""
            End Select

            If (Val(strTot) > 0) Then
                If (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                    Bil2 = "Puluh "
                ElseIf (z = 3 Or z = 6 Or z = 9 Or z = 12 Or z = 15) Then
                    Bil2 = "Ratus "
                Else
                    Bil2 = ""
                End If
            Else
                Bil2 = ""
            End If
            If (y > 0) Then
                Select Case z
                    Case 4
                        Bil2 = Bil2 + "Ribu "
                        y = 0
                    Case 7
                        Bil2 = Bil2 + "Juta "
                        y = 0
                    Case 10
                        Bil2 = Bil2 + "Milyar "
                        y = 0
                    Case 13
                        Bil2 = Bil2 + "Trilyun "
                        y = 0
                End Select
            End If

            Urai = Urai + Bil1 + Bil2
        End While
        Urai = Urai + strPecahan
        Terbilang = Urai
    End Function

    Protected Sub iuiPembayaranDetailsView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles iuiPembayaranDetailsView.DataBound
        If Session("PermohonanID") IsNot Nothing Then
            Dim criteria As CriteriaOperator = CriteriaOperator.Parse("PermohonanID = '" & Session("PermohonanID").ToString & "'")
            Dim objIUI As IUI = DirectCast(session1.FindObject(GetType(IUI), criteria), IUI)
            If objIUI IsNot Nothing Then
                Dim dv As DetailsView = DirectCast(sender, DetailsView)
                If dv.FindControl("rekeningASPxComboBox") IsNot Nothing Then
                    Dim cb As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
                    If Not objIUI.rek_id.Equals(Nothing) Then
                        Dim rek As Rekening = DirectCast(session1.GetObjectByKey(GetType(Rekening), objIUI.rek_id), Rekening)
                        cb.Value = rek.rek_id
                        cb.Text = rek.rekening
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub iuiPembayaranDetailsView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles iuiPembayaranDetailsView.ItemUpdating
        Dim dv As DetailsView = DirectCast(sender, DetailsView)
        If dv.FindControl("rekeningASPxComboBox") IsNot Nothing Then
            Dim cb As ASPxComboBox = DirectCast(dv.FindControl("rekeningASPxComboBox"), ASPxComboBox)
            e.NewValues.Item("rek_id") = cb.Value
        End If
    End Sub

End Class
