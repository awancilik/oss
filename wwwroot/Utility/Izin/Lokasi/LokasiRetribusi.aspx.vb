Option Explicit On
Option Strict On
Imports System
Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Data.Filtering
Imports Bisnisobjek.OSS

Partial Class Utility_Izin_LokasiRetribusi
    Inherits System.Web.UI.Page
    Private session1 As Session

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("LokasiID") = Nothing
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        session1 = New Session
        LokasiRetribusiDetailsXpoDataSource.Session = session1
        HDPPTXpoDataSource.Session = session1
        IUXpoDataSource.Session = session1
        IPXpoDataSource.Session = session1
    End Sub

    Protected Overrides Sub Render(ByVal writer As System.Web.UI.HtmlTextWriter)
        MyBase.Render(writer)
        session1.Dispose()
    End Sub

#Region " Buat Retribusi "
    Protected Sub BuatRetribusiButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BuatRetribusiButton.Click
        BuatRetribusiPanel.Visible = True
        EditRetribusiPanel.Visible = False
        RetribusiDetailView.Visible = False
    End Sub
    Protected Sub NoPermohonanLokasiButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanLokasiButton.Click
        PeringatanLabel.Visible = False
        Dim noPermohonan As String = NoPermohonanTextBox.Text.Trim
        If noPermohonan IsNot Nothing Then
            Dim query0 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
            Dim objPermohonan As Permohonan = TryCast(session1.FindObject(GetType(Permohonan), query0), Permohonan)
            If objPermohonan IsNot Nothing Then
                Dim query1 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & objPermohonan.PermohonanID.ToString & "'")
                Dim objPD As PermohonanDetail = TryCast(session1.FindObject(GetType(PermohonanDetail), query1), PermohonanDetail)
                If objPD IsNot Nothing Then
                    If objPD.JenisIzinID.JenisIzinNama = "Lokasi" Then
                        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & objPD.PermohonanIzinID.ToString & "'")
                        Dim objlokasi As Lokasi = TryCast(session1.FindObject(GetType(Lokasi), query2), Lokasi)
                        Session("objLokasiRet") = objlokasi
                        Session("retLokasiID") = objlokasi.LokasiID.ToString
                        Dim query3 As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & objlokasi.LokasiID.ToString & "'")
                        Dim objLR As LokasiRetribusi = TryCast(session1.FindObject(GetType(LokasiRetribusi), query3), LokasiRetribusi)
                        If objLR IsNot Nothing Then
                            PeringatanLabel.Text = "Data Sudah Ada ! "
                            PeringatanLabel.Visible = True
                        Else
                            RetribusiDetailView.Visible = True
                            RetribusiDetailView.ChangeMode(DetailsViewMode.Insert)
                        End If
                    Else
                        PeringatanPopupControl.ShowOnPageLoad = True
                    End If
                Else
                    PeringatanPopupControl.ShowOnPageLoad = True
                End If
            Else
                PeringatanPopupControl.ShowOnPageLoad = True
            End If
        Else
            PeringatanPopupControl.ShowOnPageLoad = True
        End If

    End Sub
#End Region

#Region " Edit Retribusi "

    Protected Sub EditRetribusiButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditRetribusiButton.Click
        EditRetribusiPanel.Visible = True
        BuatRetribusiPanel.Visible = False
        RetribusiDetailView.Visible = False
    End Sub

    Protected Sub NoPermohonanEditButton_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles NoPermohonanEditButton.Click
        PeringatanLabel.Visible = False
        Dim noPermohonan As String = noPermohononanEditTextBox.Text
        If noPermohonan IsNot Nothing Then
            Dim query0 As CriteriaOperator = CriteriaOperator.Parse("NomorPermohonan='" & noPermohonan & "'")
            Dim objPermohonan As Permohonan = TryCast(session1.FindObject(GetType(Permohonan), query0), Permohonan)
            If objPermohonan IsNot Nothing Then
                Dim query1 As CriteriaOperator = CriteriaOperator.Parse("PermohonanID='" & objPermohonan.PermohonanID.ToString & "'")
                Dim objPD As PermohonanDetail = TryCast(session1.FindObject(GetType(PermohonanDetail), query1), PermohonanDetail)
                If objPD IsNot Nothing Then
                    If objPD.JenisIzinID.JenisIzinNama = "Lokasi" Then
                        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & objPD.PermohonanIzinID.ToString & "'")
                        Dim objlokasi As Lokasi = TryCast(session1.FindObject(GetType(Lokasi), query2), Lokasi)
                        Session("objLokasiRet") = objlokasi
                        Session("retLokasiID") = objlokasi.LokasiID.ToString
                        Dim query3 As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & objlokasi.LokasiID.ToString & "'")
                        Dim objLR As LokasiRetribusi = TryCast(session1.FindObject(GetType(LokasiRetribusi), query3), LokasiRetribusi)
                        Dim criteria As CriteriaOperator = CriteriaOperator.Parse("LokasiRetribusiID='" & objLR.LokasiRetribusiID.ToString & "' AND LokasiID='" & objlokasi.LokasiID.ToString & "'")
                        Session("lokretid") = objLR.LokasiRetribusiID.ToString
                        LokasiRetribusiDetailsXpoDataSource.Criteria = criteria.ToString
                        RetribusiDetailView.Visible = True
                        RetribusiDetailView.ChangeMode(DetailsViewMode.Edit)
                    Else
                        PeringatanPopupControl.ShowOnPageLoad = True
                    End If
                Else
                    PeringatanPopupControl.ShowOnPageLoad = True
                End If
            Else
                PeringatanPopupControl.ShowOnPageLoad = True
            End If
        Else
            PeringatanPopupControl.ShowOnPageLoad = True
        End If
    End Sub

#End Region

#Region " Retribusi Insert "

    Protected Sub RetribusiDetailView_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles RetribusiDetailView.ItemInserting
        Dim Retribusiid As Guid = Guid.NewGuid
        Session("RetribusiID") = Retribusiid
        e.Values.Item("LokasiRetribusiID") = Retribusiid
    End Sub

    Protected Sub RetribusiDetailView_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles RetribusiDetailView.ItemInserted
        Dim dv As DetailsView = RetribusiDetailView
        Dim comHdppt As ASPxComboBox = DirectCast(dv.FindControl("PeruntukanComboBox"), ASPxComboBox)
        Dim comIP As ASPxComboBox = DirectCast(dv.FindControl("IPComboBox"), ASPxComboBox)
        Session("comIP") = comIP.Text
        Dim comIU As ASPxComboBox = DirectCast(dv.FindControl("IUComboBox"), ASPxComboBox)
        Session("comIU") = comIU.Text
        Dim comJenis As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
        Dim textLuas As ASPxTextBox = DirectCast(dv.FindControl("TanahTextBox"), ASPxTextBox)
        Dim peruntukan As String = comHdppt.Text
        Dim Jenis As String = comJenis.Text

        Dim lIPid As CriteriaOperator = CriteriaOperator.Parse("LokasiIP_='" & CStr(comIP.Value) & "'")
        Dim IPid As LokasiIP = DirectCast(session1.FindObject(GetType(LokasiIP), lIPid), LokasiIP)
        Dim ip As Decimal = CDec(IPid.Indeks.ToString)

        Dim lIUid As CriteriaOperator = CriteriaOperator.Parse("LokasiIU_='" & CStr(comIU.Value) & "'")
        Dim IUid As LokasiIU = DirectCast(session1.FindObject(GetType(LokasiIU), lIUid), LokasiIU)
        Dim iu As Decimal = CDec(IUid.Indek.ToString)

        Dim luas As Double = CDbl(textLuas.Text)
        Dim query As CriteriaOperator = CriteriaOperator.Parse("Peruntukan='" & peruntukan & "' AND Jenis='" & Jenis & "'")
        Dim objHDPPT As LokasiHDPPT = DirectCast(session1.FindObject(GetType(LokasiHDPPT), query), LokasiHDPPT)
        Dim harga As Integer = CInt(objHDPPT.Harga)
        Dim retribusi As Decimal = CDec(CInt(harga * ip * iu) * luas)
        Dim tbul As String = Right(retribusi.ToString, 2)
        If tbul IsNot "00" Then
            Dim tbl As Decimal = CInt(tbul)
            If tbl < 50 Then
                Dim penguruangan As Decimal = retribusi - tbl
                retribusi = penguruangan
            Else
                Dim penambahan As Decimal = 100 - tbl
                retribusi = retribusi + penambahan
            End If
        End If
        Dim objlokasi As Lokasi = CType(Session("objLokasiRet"), Lokasi)
        Dim lokasiid As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & objlokasi.LokasiID.ToString & "'")
        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("LokasiRetribusiID='" & Session("RetribusiID").ToString & "'")
        Dim objlokret As LokasiRetribusi = DirectCast(session1.FindObject(GetType(LokasiRetribusi), query2), LokasiRetribusi)
        objlokret.LokasiID = DirectCast(session1.FindObject(GetType(Lokasi), lokasiid), Lokasi)
        objlokret.Retribusi = retribusi
        objlokret.Terbilang = Terbilang(retribusi.ToString)
        objlokret.HDPPTPeruntukan = peruntukan
        objlokret.HDPPTJenis = Jenis
        objlokret.HDPPTHarga = harga
        objlokret.IP = DirectCast(session1.FindObject(GetType(LokasiIP), lIPid), LokasiIP)
        objlokret.IU = DirectCast(session1.FindObject(GetType(LokasiIU), lIUid), LokasiIU)
        objlokret.Luas = luas
        objlokret.Save()
        dv.ChangeMode(DetailsViewMode.ReadOnly)
    End Sub
#End Region

#Region " Retribusi Update "
    Protected Sub RetribusiDetailView_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles RetribusiDetailView.ItemUpdating
        Dim dv As DetailsView = RetribusiDetailView
        Dim tbLuas As ASPxTextBox = DirectCast(dv.FindControl("TanahTextBox"), ASPxTextBox)
        Dim comPeruntukan As ASPxComboBox = DirectCast(dv.FindControl("PeruntukanComboBox"), ASPxComboBox)
        Dim comJenis As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
        Dim comIP As ASPxComboBox = DirectCast(dv.FindControl("IPComboBox"), ASPxComboBox)
        Dim comIU As ASPxComboBox = DirectCast(dv.FindControl("IUComboBox"), ASPxComboBox)
        Session("comIP") = comIU.Text
        Session("comIP") = comIP.Text
        Dim peruntukan As String = CStr(comPeruntukan.Value)
        Dim Jenis As String = CStr(comJenis.Value)

        Dim lIpid As String = CStr(comIP.Value)
        Dim queryIP As CriteriaOperator = CriteriaOperator.Parse("LokasiIP_='" & lIpid & "'")
        Dim Ipid As LokasiIP = DirectCast(session1.FindObject(GetType(LokasiIP), queryIP), LokasiIP)
        Dim ip As Decimal = CDec(Ipid.Indeks.ToString)

        Dim lIUid As String = CStr(comIU.Value)
        Dim queryIU As CriteriaOperator = CriteriaOperator.Parse("LokasiIU_='" & lIUid & "'")
        Dim IUid As LokasiIU = DirectCast(session1.FindObject(GetType(LokasiIU), queryIU), LokasiIU)
        Dim iu As Decimal = CDec(IUid.Indek.ToString)

        Dim luas As Double = CDbl(tbLuas.Text)
        Dim query As CriteriaOperator = CriteriaOperator.Parse("Peruntukan='" & peruntukan & "' AND Jenis='" & Jenis & "'")
        Dim objHDPPT As LokasiHDPPT = DirectCast(session1.FindObject(GetType(LokasiHDPPT), query), LokasiHDPPT)
        Dim harga As Integer = CInt(objHDPPT.Harga)
        Dim tril As Double = harga * ip * iu
        Dim ril As Double = tril * luas
        Dim retribusi As Integer = CInt(ril)
        Dim tbul As String = Right(retribusi.ToString, 2)
        If tbul IsNot "00" Then
            Dim tbl As Integer = CInt(tbul)
            If tbl < 50 Then
                Dim penguruangan As Integer = retribusi - tbl
                retribusi = penguruangan
            Else
                Dim penambahan As Integer = 100 - tbl
                retribusi = retribusi + penambahan
            End If
        End If

        Dim query2 As CriteriaOperator = CriteriaOperator.Parse("LokasiRetribusiID='" & Session("lokretid").ToString & "' AND LokasiID='" & Session("retLokasiID").ToString & "'")
        Dim objLR As LokasiRetribusi = DirectCast(session1.FindObject(GetType(LokasiRetribusi), query2), LokasiRetribusi)
        With objLR
            .Luas = luas
            .Retribusi = retribusi
            .Terbilang = Terbilang(retribusi.ToString)
            .HDPPTPeruntukan = peruntukan
            .HDPPTJenis = Jenis
            .HDPPTHarga = harga
            .IP = DirectCast(session1.FindObject(GetType(LokasiIP), queryIP), LokasiIP)
            .IU = DirectCast(session1.FindObject(GetType(LokasiIU), queryIU), LokasiIU)
            .Save()
        End With


    End Sub

    Protected Sub RetribusiDetailView_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles RetribusiDetailView.ItemUpdated
        Dim dv As DetailsView = RetribusiDetailView
        dv.Visible = True
        dv.ChangeMode(DetailsViewMode.ReadOnly)
    End Sub
#End Region

#Region " Callback "

    Protected Sub PeruntukanCallback_CallBack(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("HDPPTPeruntukan") = e.Parameter
    End Sub

    Protected Sub JenisCallback_CallBack(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("HDPPTJenis") = e.Parameter
    End Sub

    Protected Sub IPCallback_CallBack(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("IP") = e.Parameter
    End Sub

    Protected Sub IUCallback_CallBack(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
        Session("IU") = e.Parameter
    End Sub

#End Region

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

    Protected Sub RetribusiDetailView_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles RetribusiDetailView.DataBound
        Dim dv As DetailsView = RetribusiDetailView
        Dim objLokasi As Lokasi = CType(Session("objLokasiRet"), Lokasi)


        If dv.CurrentMode = DetailsViewMode.Edit Then
            Dim query1 As CriteriaOperator = CriteriaOperator.Parse("LokasiID='" & objLokasi.LokasiID.ToString & "'")
            Dim objLR As LokasiRetribusi = TryCast(session1.FindObject(GetType(LokasiRetribusi), query1), LokasiRetribusi)
            Session("objLR") = objLR
            Session("LokasiRetribusiID") = objLR.LokasiRetribusiID.ToString
            If objLR IsNot Nothing Then
                Dim comUntuk As ASPxComboBox = DirectCast(dv.FindControl("PeruntukanComboBox"), ASPxComboBox)
                Dim comJenis As ASPxComboBox = DirectCast(dv.FindControl("JenisComboBox"), ASPxComboBox)
                Dim comTanah As ASPxComboBox = DirectCast(dv.FindControl("IPComboBox"), ASPxComboBox)
                Dim comUsaha As ASPxComboBox = DirectCast(dv.FindControl("IUComboBox"), ASPxComboBox)

                If objLR.HDPPTPeruntukan.ToString IsNot Nothing Then
                    comUntuk.Text = objLR.HDPPTPeruntukan
                End If
                If objLR.HDPPTJenis.ToString IsNot Nothing Then
                    comJenis.Text = objLR.HDPPTJenis.ToString
                End If
                If objLR.IP.ToString IsNot Nothing Then
                    Dim ipq As CriteriaOperator = CriteriaOperator.Parse("LokasiIP_='" & objLR.IP.LokasiIP_.ToString & "'")
                    Dim iUsaha As LokasiIP = DirectCast(session1.FindObject(GetType(LokasiIP), ipq), LokasiIP)
                    comTanah.Value = objLR.IP.LokasiIP_
                    comTanah.Text = objLR.IP.IPTanah
                End If
                If objLR.IU.ToString IsNot Nothing Then
                    Dim iuq As CriteriaOperator = CriteriaOperator.Parse("LokasiIU_='" & objLR.IU.LokasiIU_.ToString & "'")
                    Dim iUsaha As LokasiIU = DirectCast(session1.FindObject(GetType(LokasiIU), iuq), LokasiIU)
                    comUsaha.Value = iUsaha.LokasiIU_
                    comUsaha.Text = iUsaha.Jenis
                End If
            End If
        ElseIf dv.CurrentMode = DetailsViewMode.ReadOnly Then
            Dim IPLabel As ASPxLabel = DirectCast(dv.FindControl("IPLabel"), ASPxLabel)
            Dim IULabel As ASPxLabel = DirectCast(dv.FindControl("IULabel"), ASPxLabel)
            If IPLabel IsNot Nothing Then
                IPLabel.Text = CStr(Session("comIP"))
            End If
            If IULabel IsNot Nothing Then
                IULabel.Text = CStr(Session("comIU"))
            End If

        End If
    End Sub

End Class
