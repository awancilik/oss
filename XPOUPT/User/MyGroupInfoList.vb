<Serializable()> Public Class MyGroupInfoList
    Inherits ReadOnlyListBase(Of MyGroupInfoList, MyGroupInfo)

#Region " Factory Methods "

    Public Shared Function GetList() As MyGroupInfoList
        Return DataPortal.Fetch(Of MyGroupInfoList)()
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
                cm.CommandText = "SELECT groupId, groupDesc FROM mGroup"

                Using dr As New SafeDataReader(cm.ExecuteReader)
                    While dr.Read
                        Add(MyGroupInfo.GetGroup(dr))
                    End While
                End Using

            End Using
        End Using

        IsReadOnly = True
        RaiseListChangedEvents = True
    End Sub

#End Region

End Class
