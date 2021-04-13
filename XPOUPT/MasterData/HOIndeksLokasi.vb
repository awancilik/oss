Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOIndeksLokasi
		Inherits XPLiteObject
		Dim fHOIndeksLokasiID As Guid
		<Key(true)> _
		Public Property HOIndeksLokasiID() As Guid
			Get
				Return fHOIndeksLokasiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOIndeksLokasiID", fHOIndeksLokasiID, value)
			End Set
		End Property
		Dim fJenisLokasi As String
		Public Property JenisLokasi() As String
			Get
				Return fJenisLokasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisLokasi", fJenisLokasi, value)
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
