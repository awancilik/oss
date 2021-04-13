Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOIndeksGangguan
		Inherits XPLiteObject
		Dim fHOIndeksGangguanID As Guid
		<Key(true)> _
		Public Property HOIndeksGangguanID() As Guid
			Get
				Return fHOIndeksGangguanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOIndeksGangguanID", fHOIndeksGangguanID, value)
			End Set
		End Property
		Dim fJenisGangguan As String
		<Size(50)> _
		Public Property JenisGangguan() As String
			Get
				Return fJenisGangguan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisGangguan", fJenisGangguan, value)
			End Set
		End Property
        Dim fIndeks As Decimal
        Public Property Indeks() As Decimal
            Get
                Return fIndeks
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("Indeks", fIndeks, value)
            End Set
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
