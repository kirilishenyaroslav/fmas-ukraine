{ -internal}
{-$Id: FieldControl.pas,v 1.1.1.1 2005/07/07 10:35:18 oleg Exp $}

{****************************************************************************}
{                            Пакет SpLib                                     }
{             облегчение работы с Interbase под Delphi 5                     }
{                        (c) Qizz 2002-2003                                  }
{       ( Олег Волков при участии Даниила Збуривского, Родиона Миронова )    }
{               распространяется по личной договоренности                    }
{****************************************************************************}

{                Компонент TFieldControl - ядро SpLib                        }
{       управление считыванием, отображением, проверкой и записью поля БД    }

unit FieldControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, StdCtrls, IBQuery, ComCtrls, DBCtrls, SpComboBox, IBCustomDataSet,
  Buttons, CheckEditUnit, Mask, ExtCtrls,Variants, Spin, SpTimeUtils;

type
  TCapitalizeStyle = (csNone, csAll, csName);

  TFieldControl = class(TGraphicControl)
  private
	FField:		TField;
	FControl:	TControl;

	FTitle:		String;
	FRequired:	Boolean;
	FNeedUpdate:	Boolean;
	FNotNull:	Boolean;

	FMaxLength:	Integer;
	FExactLength:	Integer;
	FCapitalizeStyle: TCapitalizeStyle;

	FError:		String;

	FDefault:	Variant;
	FOldValue:	Variant;
	FValue:		Variant;

	FOnGet:		TNotifyEvent;
	FOnShow:	TNotifyEvent;
	FAfterRead:	TNotifyEvent;

	procedure	SetValue(Val: Variant);
	function	GetChanged: Boolean;
	function	DefaultToNull: Boolean;

  protected
    { Protected declarations }

  public
    FColor:     TColor;

	procedure	Zero;
	procedure	Prepare;
	function	Check: Boolean;
	procedure	Tell;
	procedure	SetReadOnly(b: Boolean);
	function	DefaultValue: Variant;

	procedure	ReadData;
	procedure	Show;
	procedure	Get;
    procedure   SaveColor;
    procedure   SetColor(color: TColor);


	procedure	Paint;override;
	constructor	Create(AOwner: TComponent);override;

  published
	property Control: TControl read FControl write FControl;
	property ReadFromField: TField read FField write FField;
	property Required: Boolean read FRequired write FRequired default True;
	property NotNull: Boolean read FNotNull write FNotNull default False;
	property Title: String read FTitle write FTitle;
	property NeedUpdate: Boolean read FNeedUpdate write FNeedUpdate	default True;
	property MaxLength: Integer read FMaxLength write FMaxLength;
	property ExactLength: Integer read FExactLength write FExactLength;
	property CapitalizeStyle: TCapitalizeStyle
		read FCapitalizeStyle write FCapitalizeStyle;
	property Value: Variant read FValue write SetValue;
	property OldValue: Variant read FOldValue;
	property IsChanged: Boolean read GetChanged;
	property Default: Variant read FDefault write FDefault;
	property OnGet: TNotifyEvent read FOnGet write FOnGet;
	property OnShow: TNotifyEvent read FOnShow write FOnShow;
	property AfterRead: TNotifyEvent read FAfterRead write FAfterRead;
  end;


var
	DefaultDateBeg: TDateTime;
        DefaultDateEnd: TDateTime;

procedure Register;

implementation
{$R FieldControl.res}

procedure	TFieldControl.Show;
var
	Val: Variant;
begin
    SaveColor;
    
	if Assigned(FOnShow) then
	begin
		FOnShow(Self);
		Exit;
	end;

	if VarIsNull(FValue) then Val := DefaultValue
	else	Val := FValue;

	if FControl <> nil then
	begin
        if FControl is TSpinEdit then
            (FControl as TSpinEdit).Value := Val
        else
		if FControl is TCustomMaskEdit then
			(FControl as TCustomMaskEdit).Text := Val
		else
		if FControl is TCustomEdit then
			(FControl as TCustomEdit).Text := Val
		else
		if FControl is TDBLookupControl then
			(FControl as TDBLookupComboBox).KeyValue := Val
		else
		if FControl is TSpComboBox then
			(FControl as TSpComboBox).Prepare(Val,'')
		else
		if FControl is TDateTimePicker then
		with FControl as TDateTimePicker do
		begin
			DateTime := Val;
			if (Val = DefaultValue) and Required then
			begin
				ShowCheckBox := True;
				Checked := False;
			end;
		end
		else
		if FControl is TCheckBox then
			(FControl as TCheckBox).Checked := (Val = 'T')
		else
		if FControl is TComboBox then
			(FControl as TComboBox).ItemIndex := Val-1
		else
		if FControl is TLabel then
			(FControl as TLabel).Caption := Val
		else
		if FControl is TRadioGroup then
			if Val = 'T' then
				(FControl as TRadioGroup).ItemIndex := 0
			else	(FControl as TRadioGroup).ItemIndex := 1;
	end;
end;

procedure	TFieldControl.Get;
var
	Val: Variant;
	picker: TDateTimePicker;
	hyphen: Integer;
	s: String;
begin
	if Assigned(FOnGet) then
	begin
		FOnGet(Self);
		Exit;
	end;

	Val := Null;

	if FControl = nil then
	begin
		if VarIsNull(FValue) and FNotNull then FValue := 0;
		Exit;
	end;

    if FControl is TSpinEdit then
        Val := (FControl as TSpinEdit).Value

    else

	if FControl is TCustomMaskEdit then
        Val := Trim( (FControl as TCustomMaskEdit).Text )
	else

	if FControl is TCustomEdit then
		Val := Trim( (FControl as TCustomEdit).Text )
	else

	if FControl is TDBLookupControl then
		Val := (FControl as TDBLookupComboBox).KeyValue
	else

	if FControl is TSpComboBox then
		Val := (FControl as TSpComboBox).GetId
	else

	if FControl is TDateTimePicker then
	begin
		picker := FControl as TDateTimePicker;
		if picker.ShowCheckbox and not picker.Checked then
			Val := DefaultDateEnd
		else	Val := StrToDateTime(DateTimeToStr(picker.DateTime));
	end
	else

	if FControl is TCheckBox then
		if  (FControl as TCheckBox).Checked then
			Val := 'T'
		else	Val := 'F'
	else

	if FControl is TComboBox then
		Val := (FControl as TComboBox).ItemIndex+1
	else

	if FControl is TLabel then
		Val := (FControl as TLabel).Caption
	else

	if FControl is TRadioGroup then
		if (FControl as TRadioGroup).ItemIndex = 0 then Val := 'T'
		else Val := 'F';

	if VarType(Val) = varString then
	begin
		s := Val;
		case FCapitalizeStyle of
		csAll:  s := AnsiUpperCase(s);
		csName:
			if Length(s) > 0 then
			begin
				s := AnsiLowerCase(s);
				s[1] := AnsiUpperCase(s[1])[1];
				hyphen := Pos('-',s);
				if hyphen <> 0 then
				s[hyphen+1] :=
					AnsiUpperCase(s[hyphen+1])[1];
			end;
		end;
		Val := s;
	end;

	if DefaultToNull and not FNotNull and not VarIsNull(Val) then
		if Val = DefaultValue then Val := Null;

	SetValue(Val);
end;

procedure	TFieldControl.SetReadOnly(b: Boolean);
begin
	if FControl <> nil then
	begin
		if FControl is TWinControl then
			(FControl as TWinControl).TabStop := not b;
		if FControl is TEdit then
			(FControl as TEdit).ReadOnly := b
		else
                if FControl is TMemo then
                        (FControl as TMemo).ReadOnly := b
                else
		if FControl is TCheckEdit then
		begin
			(FControl as TCheckEdit).ReadOnly := b;
			(FControl as TCheckEdit).Dim(b);
		end;
		if FControl is TDateTimePicker then
			(FControl as TDateTimePicker).Enabled := not b;
	end;
end;

function	TFieldControl.Check: Boolean;
var
	picker: TDateTimePicker;
	s: String;
begin
	FError := '';
	Result := True;

    if not FNeedUpdate then Exit;

	if FRequired then
	begin
		if VarIsNull(FValue) or VarIsEmpty(FValue) then Result := False
		else

		if (FControl is TCustomMaskEdit) then
		with FControl as TCustomMaskEdit do
		begin
			if Text <> EditText then Result := False;
		end
		else

		if FControl is TDateTimePicker then
		begin
			picker := FControl as TDateTimePicker;
			if picker.ShowCheckBox and not picker.Checked then
				Result := False;
		end;

		if Result = False then
		begin
			FError := 'Не задане необхідне поле ' + FTitle;
			Exit;
		end;
	end;

	if VarType(FValue) = varString then
	begin
		s := FValue;

		if ( FMaxLength <> 0 ) and ( Length(s) > FMaxLength ) then
		begin
			FError := 'Занадто довге поле ' + FTitle +
			'. Довжина повинна бути не більш ніж '+
			IntToStr(FMaxLength)+'.';
			Result := False;
			Exit;
		end;

		if (s <> '') and (FExactLength <> 0)
			and ( Length(s) <> FExactLength) then
		begin
			FError := 'Невірна довжина поля ' + FTitle +
			'. Повинна дорівнювати '+ IntToStr(FExactLength)+ '. ' +
			' (Зараз: ' + IntToStr(Length(s))+ ')';
			Result := False;
			Exit;
		end;

	end;

	if FField  <> nil then
	begin
		if (FField is TIntegerField) and
			(VarType(FValue) = varString) then
		if FValue = '' then
		begin
			FValue := 0;
			if FRequired then
			begin
				FError := 'Не задане необхідне поле ' + FTitle;
				Result := False;
				Exit;
			end;
		end
		else
		try
			FValue := StrToInt(FValue);
		except
			on EConvertError do
			begin
				FError := 'Поле ' + FTitle +
					' повинно бути цілим числом';
				Result := False;
				Exit;
			end;
		end;

        if ( FField <> nil ) and (FField is TTimeField) then
            try
                FValue := EncodeTimeString(FValue,False);
            except
            begin
                FError := 'Поле ' + FTitle + ' повинно бути коректним записом часу';
            end
            end;

		if ( (FField is TBCDField) or (FField is TFloatField) ) and
			(VarType(FValue) = varString) then
		if FValue = '' then
		begin
			FValue := 0;
			if FRequired then
			begin
				FError := 'Не задане необхідне поле ' + FTitle;
				Result := False;
				Exit;
			end;
		end
		else
		try
			FValue := StringReplace(FValue,'.',DecimalSeparator,[]);
			FValue := StringReplace(FValue,',',DecimalSeparator,[]);
			FValue := StrToFloat(FValue);
		except
			on EConvertError do
			begin
				FError := 'Поле ' + FTitle +
					' повинно бути дробовим числом';
				Result := False;
				Exit;
			end;
		end;
         //---
	end;
        if (FField = nil) and (VarType(FValue) = varString)
			and( (Pos('.', FValue) <> 0 ) or (Pos(',', FValue) <> 0 ))
		then
		try
			s := StringReplace(FValue,'.',DecimalSeparator,[]);
			s := StringReplace(FValue,',',DecimalSeparator,[]);
			FValue := StrToFloat(s);
		except
		end;
end;

procedure	TFieldControl.Tell;
var
	ctrl: TWinControl;
begin
	MessageDlg(FError, mtError, [mbOk], 0);

	if (FControl <> nil) and (FControl is TWinControl) then
	begin
		ctrl := FControl as TWinControl;
		if not ctrl.Enabled then Exit;
		with ctrl do
		begin
			if (Parent is TTabSheet)
				and (Parent.Parent is TPageControl)
			then (Parent.Parent as TPageControl).ActivePage :=
				Parent as TTabSheet;
			SetFocus;
		end;
	end;
end;

function	TFieldControl.DefaultToNull: Boolean;
begin
	if FControl is TSpComboBox then
		Result := True
	else
	if (FControl is TDateTimePicker) or (FControl is TCheckBox) or
	   (FControl is TComboBox) or (FControl is TRadioGroup) then
		Result := False
	else
		Result := True;
end;

function	TFieldControl.DefaultValue: Variant;
begin
	if FControl = nil then Result := 0
	else
	if FControl is TSpComboBox then Result := -1
	else
	if FControl is TCheckBox then Result := 'F'
	else
	if FControl is TDateTimePicker then
		if FRequired then
			Result := DefaultDateBeg
		else	Result := DefaultDateEnd
	else
    if FControl is TSpinEdit then Result := 1
    else
	if FControl is TDBLookupControl then Result := 0
	else
	if (FControl is TCustomEdit) or (FControl is TLabel) then
		Result := ''
	else
	if (FControl is TComboBox) then Result := 1
	else
	if (FControl is TRadioGroup) then Result := 'T';
end;

function	TFieldControl.GetChanged: Boolean;
begin
	try
	if VarIsEmpty(FOldValue) then FOldValue := Null;
	if VarIsEmpty(FValue) then FValue := Null;
	if VarIsNull(FOldValue) then
		if VarIsNull(FValue) or (FValue = DefaultValue) then
			Result := False
		else	Result := True
	else
	if VarIsNull(FValue) then
		if VarIsNull(FOldValue) or (FOldValue = DefaultValue) then
			Result := False
		else	Result := True
	else	Result := (FValue <> FOldValue);
	except
		Result := True;		// rewrite this!
	end;
end;

procedure	TFieldControl.Zero;
begin
	if not VarIsEmpty(FDefault) and not VarIsNull(FDefault) then
		SetValue(FDefault)
	else	SetValue(Null);
	Show;
end;

procedure	TFieldControl.Prepare;
begin
	ReadData;
	Show;
	if FControl is TDateTimePicker then
		(FControl as TDateTimePicker).ShowCheckBox := False;
end;

procedure	TFieldControl.ReadData;
begin
	if FField <> nil then
		SetValue(FField.Value);
	if Assigned(FAfterRead) then FAfterRead(Self);
end;

procedure	TFieldControl.SetValue(Val: Variant);
begin
    if (FControl is TCustomMaskEdit) and (FField is TTimeField) and
            not VarIsNull(Val) and (VarType(Val) <> varString)
                then Val := TimeToStr(Val);

	if not(FControl is TDateTimePicker) and (VarType(Val)=varDate)
		then	Val := DateTimeToStr(Val);

	FOldValue := FValue;
	FValue := Val;
end;

procedure Register;
begin
	RegisterComponents('Samples', [TFieldControl]);
end;

procedure   TFieldControl.SaveColor;
begin
    if FControl <> nil then
        if FControl is TMaskEdit then
            FColor := (FControl as TMaskEdit).Color
        else
        if FControl is TEdit then
            FColor := (FControl as TEdit).Color
        else
        if FControl is TComboBox then
            FColor := (FControl as TComboBox).Color
        else
        if FControl is TDateTimePicker then
            FColor := (FControl as TDateTimePicker).Color
        else
        if FControl is TCheckBox then
            FColor := (FControl as TCheckBox).Color;
end;

procedure   TFieldControl.SetColor(color: TColor);
begin
    if FControl <> nil then
        if FControl is TMaskEdit then
            (FControl as TMaskEdit).Color := color
        else
        if FControl is TEdit then
            (FControl as TEdit).Color := color
        else
        if FControl is TComboBox then
            (FControl as TComboBox).Color := color
        else
        if FControl is TDateTimePicker then
            (FControl as TDateTimePicker).Color := color
        else
        if FControl is TCheckBox then
            (FControl as TCheckBox).Color := color;
end;

constructor	TFieldControl.Create(AOwner: TComponent);
begin
	inherited Create(AOwner);

	FNeedUpdate := True;
	FRequired := True;
	FNotNull := False;
	Height := 18;
	Width := 18;
	Visible := False;
end;


procedure	TFieldControl.Paint;
begin
	inherited;
	with Canvas do
	begin
		MoveTo(0,Height div 2);
		LineTo(Width,Height div 2);
		MoveTo(0,Height div 2);
		LineTo(Width div 3,Height div 6);
		MoveTo(0,Height div 2);
		LineTo(Width div 3,Height - Height div 6);
	end;
end;

end.
