Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPIDetail
		Inherits XPLiteObject
		Dim fIPIDetailID As Guid
		<Key(true)> _
		Public Property IPIDetailID() As Guid
			Get
				Return fIPIDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPIDetailID", fIPIDetailID, value)
			End Set
		End Property
        Dim fIPIID As IPI
        <Association("IPI-IPIDetail")> _
        Public Property IPIID() As IPI
            Get
                Return fIPIID
            End Get
            Set(ByVal value As IPI)
                SetPropertyValue(Of IPI)("IPIID", fIPIID, value)
            End Set
        End Property
        Dim fKLUIID As JenisUsahaKLUI
        Public Property KLUIID() As JenisUsahaKLUI
            Get
                Return fKLUIID
            End Get
            Set(ByVal value As JenisUsahaKLUI)
                SetPropertyValue(Of JenisUsahaKLUI)("KLUIID", fKLUIID, value)
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
