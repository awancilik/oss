<Serializable()> Public Class MyUserInfoList
    Inherits ReadOnlyListBase(Of MyUserInfoList, MyUserInfo)

#Region " Factory Methods "

    Public Shared Function GetList() As MyUserInfoList
        Return DataPortal.Fetch(Of MyUserInfoList)()
    End Function

    Private Sub New()
        'prevent direct creation
    End Sub

#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch()
        Try
            RaiseListChangedEvents = False
            Using cn As New SqlConnection(Database.DinnerDash)
                cn.Open()
                Using cm As SqlCommand = cn.CreateCommand
                    With cm
                        .CommandType = CommandType.Text
                        .CommandText = "SELECT userId, userName, userPassword, userDesc FROM mUser"

                        IsReadOnly = False
                        Using dr As New SafeDataReader(.ExecuteReader)
                            While dr.Read
                                Me.Add(MyUserInfo.GetInfo(dr))
                            End While
                        End Using
                        IsReadOnly = True
                    End With
                End Using
            End Using
            RaiseListChangedEvents = True
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

#End Region

End Class
