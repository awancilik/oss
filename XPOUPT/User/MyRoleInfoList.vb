<Serializable()> Public Class MyRoleInfoList
    Inherits ReadOnlyListBase(Of MyRoleInfoList, MyRoleInfo)

#Region " Factory Methods "

    Public Shared Function GetList() As MyRoleInfoList
        Return DataPortal.Fetch(Of MyRoleInfoList)()
    End Function

    Private Sub New()
        ' require use of factory methods
    End Sub

#End Region

#Region " Data Access "

    Private Overloads Sub DataPortal_Fetch()
        RaiseListChangedEvents = False
        IsReadOnly = False

        Using cn As New SqlConnection(Database.DinnerDash)
            cn.Open()
            Using cm As SqlCommand = cn.CreateCommand
                cm.CommandType = CommandType.Text
                cm.CommandText = "SELECT roleId, roleTitle FROM mRole"

                Using dr As New SafeDataReader(cm.ExecuteReader)
                    While dr.Read
                        Add(MyRoleInfo.GetRoleInfo(dr))
                    End While
                End Using

            End Using
        End Using

        IsReadOnly = True
        RaiseListChangedEvents = True
    End Sub

#End Region

End Class
