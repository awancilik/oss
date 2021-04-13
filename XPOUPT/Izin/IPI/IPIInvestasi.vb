﻿Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPIInvestasi
		Inherits XPLiteObject
		Dim fIPIInvestasiID As Guid
		<Key(true)> _
		Public Property IPIInvestasiID() As Guid
			Get
				Return fIPIInvestasiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPIInvestasiID", fIPIInvestasiID, value)
			End Set
		End Property
        Dim fIPIID As IPI
        Public Property IPIID() As IPI
            Get
                Return fIPIID
            End Get
            Set(ByVal value As IPI)
                SetPropertyValue(Of IPI)("IPIID", fIPIID, value)
            End Set
        End Property
        Dim fJenisModalID As IPIJenisModal
        Public Property JenisModalID() As IPIJenisModal
            Get
                Return fJenisModalID
            End Get
            Set(ByVal value As IPIJenisModal)
                SetPropertyValue(Of IPIJenisModal)("JenisModalID", fJenisModalID, value)
            End Set
        End Property
		Dim fModal As String
		<Size(20)> _
		Public Property Modal() As String
			Get
				Return fModal
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Modal", fModal, value)
			End Set
		End Property
		Dim fNilaiSebelumPerluasan As Decimal
		Public Property NilaiSebelumPerluasan() As Decimal
			Get
				Return fNilaiSebelumPerluasan
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("NilaiSebelumPerluasan", fNilaiSebelumPerluasan, value)
			End Set
		End Property
		Dim fNilaiSesudahPerluasan As Decimal
		Public Property NilaiSesudahPerluasan() As Decimal
			Get
				Return fNilaiSesudahPerluasan
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("NilaiSesudahPerluasan", fNilaiSesudahPerluasan, value)
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
