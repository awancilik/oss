Imports Microsoft.VisualBasic

Public Class Baca
    Public Function Terbilang(ByVal strAngka As String) As String
        Dim strJmlHuruf, intPecahan As Double, strPecahan$, Urai$, Bil1$, strTot$, Bil2$
        Dim X, y, z As Integer
        If strAngka = "" Then Exit Function
        strJmlHuruf = CDbl(LTrim(strAngka))
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
                        Bil1 = "satu "
                    ElseIf (z = 4) Then
                        If (X = 1) Then
                            Bil1 = "se"
                        Else
                            Bil1 = "satu "
                        End If
                    ElseIf (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                        X = X + 1
                        strTot = Mid(CStr(strJmlHuruf), X, 1)
                        z = strJmlHuruf.ToString.Length - X + 1
                        Bil2 = ""
                        Select Case Val(strTot)
                            Case 0
                                Bil1 = "sepuluh "
                            Case 1
                                Bil1 = "sebelas "
                            Case 2
                                Bil1 = "dua belas "
                            Case 3
                                Bil1 = "tiga belas "
                            Case 4
                                Bil1 = "empat belas "
                            Case 5
                                Bil1 = "lima belas "
                            Case 6
                                Bil1 = "enam belas "
                            Case 7
                                Bil1 = "tujuh belas "
                            Case 8
                                Bil1 = "delapan belas "
                            Case 9
                                Bil1 = "sembilan belas "
                        End Select
                    Else
                        Bil1 = "se"
                    End If
                Case 2
                    Bil1 = "dua "
                Case 3
                    Bil1 = "tiga "
                Case 4
                    Bil1 = "empat "
                Case 5
                    Bil1 = "lima "
                Case 6
                    Bil1 = "enam "
                Case 7
                    Bil1 = "tujuh "
                Case 8
                    Bil1 = "delapan "
                Case 9
                    Bil1 = "sembilan "
                Case Else
                    Bil1 = ""
            End Select

            If (Val(strTot) > 0) Then
                If (z = 2 Or z = 5 Or z = 8 Or z = 11 Or z = 14) Then
                    Bil2 = "puluh "
                ElseIf (z = 3 Or z = 6 Or z = 9 Or z = 12 Or z = 15) Then
                    Bil2 = "ratus "
                Else
                    Bil2 = ""
                End If
            Else
                Bil2 = ""
            End If
            If (y > 0) Then
                Select Case z
                    Case 4
                        Bil2 = Bil2 + "ribu "
                        y = 0
                    Case 7
                        Bil2 = Bil2 + "juta "
                        y = 0
                    Case 10
                        Bil2 = Bil2 + "milyar "
                        y = 0
                    Case 13
                        Bil2 = Bil2 + "trilyun "
                        y = 0
                End Select
            End If

            Urai = Urai + Bil1 + Bil2
        End While
        Urai = Urai + strPecahan
        Dim hurufdepan As String = Left(Urai, 1).ToUpper
        Dim terhapus As String = Urai.Remove(0, 1)
        Urai = hurufdepan + terhapus
        Terbilang = Urai
    End Function
End Class
