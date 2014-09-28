
{ -$Id: AdressEditUnit.pas,v 1.1.1.1 2005/07/07 10:35:07 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Редактирование адреса"                         }
{                        Редактирование данных адреса                          }
{                                                  ответственный: Олег Волков  }

unit AdressEditUnit;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, SpComboBox, Mask, DBCtrls, Buttons, Db,
  IBCustomDataSet, IBQuery, PersonalCommon, SpCommon;

type
  TAdressEditMode = (aeNew,aeModify);
  TAdressEditForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    CountrySpComboBox: TSpComboBox;
    RegionSpComboBox: TSpComboBox;
    RegionTypeSpComboBox: TSpComboBox;
    Label5: TLabel;
    PlaceSpComboBox: TSpComboBox;
    Label6: TLabel;
    PlaceTypeSpComboBox: TSpComboBox;
    Label7: TLabel;
    DistrictSpComboBox: TSpComboBox;
    Label8: TLabel;
    StreetTypeSpComboBox: TSpComboBox;
    Label9: TLabel;
    StreetSpComboBox: TSpComboBox;
    Label10: TLabel;
    HouseEdit: TEdit;
    ZIPEdit: TEdit;
    Label11: TLabel;
    FlatEdit: TEdit;
    Label12: TLabel;
    KorpusEdit: TEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
	procedure Zero;
	procedure Prepare;
	procedure Insert;
	procedure Modify;
  public
	FMode: TAdressEditMode;
  end;

var
  AdressEditForm: TAdressEditForm;

implementation

uses	AdressViewUnit;

{$R *.DFM}

procedure TAdressEditForm.Zero;
var
	i: Integer;
begin
	for i:=0 to ComponentCount-1 do
	begin
		if Components[i] is TEdit then
			(Components[i] as TEdit).Text := '';
		if Components[i] is TSpComboBox then
			(Components[i] as TSpComboBox).ItemIndex := -1;
	end;
end;

procedure TAdressEditForm.Prepare;
var
	i: Integer;
begin
	with AdressViewForm do
	begin
		ZIPEdit.Text := ResultQuery['ZIP'];
		KorpusEdit.Text := ResultQuery['Korpus'];
		HouseEdit.Text := ResultQuery['House'];
		FlatEdit.Text := ResultQuery['Flat'];

		for i:=0 to Self.ComponentCount-1 do
			if Self.Components[i] is TSpComboBox then
				with Self.Components[i] as TSpComboBox do
				Prepare(ResultQuery[SpParams.IdField],
					ResultQuery[Hint]);
	end;
end;

procedure TAdressEditForm.OkButtonClick(Sender: TObject);
begin
	if FMode = aeNew then Insert;
	if FMode = aeModify then Modify;
end;

procedure TAdressEditForm.Insert;
var
	i,id: Integer;
	s: String;
begin
	s := 'INSERT INTO ADRESS(ZIP,Korpus,House,Flat';
	for i:=0 to ComponentCount-1 do
		if Components[i] is TSpComboBox then
			with Components[i] as TSpComboBox do
				s := s + ',' + SpParams.IdField;

	s := s + ') VALUES('''+ZIPEdit.Text+ ''',''' +KorpusEdit.Text+
		''','''+HouseEdit.Text + ''',''' +FlatEdit.Text + '''';

	for i:=0 to ComponentCount-1 do
		if Components[i] is TSpComboBox then
			with Components[i] as TSpComboBox do
			begin
				id := GetId;
				if id <> -1 then s :=s + ',' + IntToStr(id)
				else s := s + ',0';
			end;
	s := s + ')';

	with AdressViewForm do
	begin
		WorkQuery.Close;
		WorkQuery.SQL.Text := s;
		ExecQuery(WorkQuery);

		ResultQuery.Close;
		ResultQuery.Open;
	end;
end;

procedure TAdressEditForm.Modify;
begin
	with AdressViewForm do
	begin
		WorkQuery.Close;
		WorkQuery.SQL.Text :=
			'UPDATE ADRESS SET DATE_END=''NOW'' WHERE ID_ADRESS='
			+IntToStr(AdressViewForm.ResultQuery['ID_ADRESS']);
		ExecQuery(WorkQuery);
	end;
	Insert;
end;

procedure TAdressEditForm.FormShow(Sender: TObject);
begin
	if FMode = aeNew then Zero;
	if FMode = aeModify then Prepare;
end;

procedure TAdressEditForm.FormActivate(Sender: TObject);
begin
	ZIPEdit.SetFocus;
end;

end.
