Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOLokasiIndeks
		Inherits XPLiteObject
		Dim fHOLokasiIndeksID As Guid
        <Key(True)> _
                <Association("HOLokasiIndeks-HOJenisLokasi")> _
              Public Property HOLokasiIndeksID() As Guid
            Get
                Return fHOLokasiIndeksID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HOLokasiIndeksID", fHOLokasiIndeksID, value)
            End Set
        End Property
		Dim fNamaIndeks As String
		<Size(50)> _
		Public Property NamaIndeks() As String
			Get
				Return fNamaIndeks
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaIndeks", fNamaIndeks, value)
			End Set
        End Property
        <Association("HOLokasiIndeks-HOJenisLokasi")> _
        Public ReadOnly Property HOJenisLokasi() As XPCollection(Of HOJenisLokasi)
            Get
                Return GetCollection(Of HOJenisLokasi)("HOJenisLokasi")
            End Get
        End Property
        Public Sub New(ByVal session As Session)
            MyBase.New(session)
        End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
