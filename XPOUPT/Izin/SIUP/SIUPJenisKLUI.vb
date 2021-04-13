Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPJenisKLUI
		Inherits XPLiteObject
		Dim fSIUPJENISKLUIID As Guid
		<Key(true)> _
		Public Property SIUPJENISKLUIID() As Guid
			Get
				Return fSIUPJENISKLUIID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPJENISKLUIID", fSIUPJENISKLUIID, value)
			End Set
		End Property
        Dim fSIUPID As SIUP
        <Association("SIUP-SIUPJenisKLUI")> _
        Public Property SIUPID() As SIUP
            Get
                Return fSIUPID
            End Get
            Set(ByVal value As SIUP)
                SetPropertyValue(Of SIUP)("SIUPID", fSIUPID, value)
            End Set
        End Property
        Dim fJenisKLUIID As JenisUsahaKLUI
        Public Property JenisKLUIID() As JenisUsahaKLUI
            Get
                Return fJenisKLUIID
            End Get
            Set(ByVal value As JenisUsahaKLUI)
                SetPropertyValue(Of JenisUsahaKLUI)("JenisKLUIID", fJenisKLUIID, value)
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
