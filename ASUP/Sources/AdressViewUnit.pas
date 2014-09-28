
{ -$Id: AdressViewUnit.pas,v 1.1.1.1 2005/07/07 10:35:07 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Просмотр адресов"                              }
{                           Просмотр адресов                                   }
{                                                  ответственный: Олег Волков  }

unit AdressViewUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Db, IBCustomDataSet, IBQuery, StdCtrls, Grids, DBGrids,
  IBDatabase, DBCtrls, ExtCtrls, ComCtrls, ToolWin, PersonalCommon,
  AdressEditUnit, SpCommon;

type
  TAdressViewForm = class(TForm)
    SpGrid: TDBGrid;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    SpDataSource: TDataSource;
    ResultQuery: TIBQuery;
    WorkQuery: TIBQuery;
    ResultQueryID_ADRESS: TIntegerField;
    ResultQueryID_COUNTRY: TIntegerField;
    ResultQueryID_REGION_TYPE: TIntegerField;
    ResultQueryID_PLACE_TYPE: TIntegerField;
    ResultQueryZIP: TIBStringField;
    ResultQueryID_STREET_TYPE: TIntegerField;
    ResultQueryKORPUS: TIBStringField;
    ResultQueryHOUSE: TIBStringField;
    ResultQueryFLAT: TIBStringField;
    ResultQueryID_PLACE: TIntegerField;
    ResultQueryID_REGION: TIntegerField;
    ResultQueryID_DISTRICT: TIntegerField;
    ResultQueryNAME_COUNTRY: TIBStringField;
    ResultQueryNAME_DISTRICT: TIBStringField;
    ResultQueryREGION: TIBStringField;
    ResultQuerySTREET: TIBStringField;
    ResultQueryPLACE: TIBStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    ZIPText: TDBText;
    Label6: TLabel;
    RegionText: TDBText;
    Label7: TLabel;
    CountryText: TDBText;
    Label8: TLabel;
    DistrictText: TDBText;
    Label9: TLabel;
    KorpusText: TDBText;
    Label10: TLabel;
    DateBegText: TDBText;
    DateEndLabel: TLabel;
    DateEndText: TDBText;
    ResultQueryNAME_STREET: TIBStringField;
    ResultQueryNAME_PLACE: TIBStringField;
    FilterGroup: TRadioGroup;
    PlaceRadio: TRadioButton;
    StreetRadio: TRadioButton;
    RegionRadio: TRadioButton;
    DistrictRadio: TRadioButton;
    Label12: TLabel;
    FilterOffButton: TSpeedButton;
    FilterEdit: TEdit;
    FilterOnButton: TSpeedButton;
    ResultQueryNAME_REGION: TIBStringField;
    ResultQueryREGION_TYPE: TIBStringField;
    ResultQueryPLACE_TYPE: TIBStringField;
    ResultQuerySTREET_TYPE: TIBStringField;
    ResultQueryID_STREET: TIntegerField;
    ResultQueryDATE_BEG: TDateField;
    ResultQueryDATE_END: TDateField;
    ToolBar1: TToolBar;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    FindButton: TSpeedButton;
    ToolButton1: TToolButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure AddButtonClick(Sender: TObject);
    procedure SpGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CancelButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure ResultQueryDATE_ENDGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FindButtonClick(Sender: TObject);
    procedure FilterOnButtonClick(Sender: TObject);
    procedure FilterOffButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpGridDblClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    function GetAdressString(IdAdress: Integer): String;
  end;

var
  AdressViewForm: TAdressViewForm;

implementation

uses	AdressSearchUnit;

{$R *.DFM}

function TAdressViewForm.GetAdressString(IdAdress: Integer): String;
begin
	if (IdAdress <> 0) and not ResultQuery.IsEmpty then
	begin
		ResultQuery.Locate('Id_Adress',IdAdress,[]);
		Result := ResultQuery['Place'] + ' ' +
			ResultQuery['Street']+' ' +ResultQuery['House'];
		if ResultQuery['Flat'] <> '' then
			Result := Result + '/' + ResultQuery['Flat'];
	end
	else	Result := '';
end;

procedure TAdressViewForm.AddButtonClick(Sender: TObject);
begin
	AdressEditForm := TAdressEditForm.Create(Self);
	AdressEditForm.FMode := aeNew;
	AdressEditForm.ShowModal;
	AdressEditForm.Free;
end;

procedure TAdressViewForm.ModifyButtonClick(Sender: TObject);
begin
	AdressEditForm := TAdressEditForm.Create(Self);
	AdressEditForm.FMode := aeModify;
	AdressEditForm.ShowModal;
	AdressEditForm.Free;
end;


procedure TAdressViewForm.SpGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	case Key of
		VK_DELETE:	DeleteButton.Click;
		VK_SPACE:	ModifyButton.Click;
		VK_ADD:		AddButton.Click;
	end;
end;

procedure TAdressViewForm.CancelButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TAdressViewForm.DeleteButtonClick(Sender: TObject);
begin
	if ResultQuery.IsEmpty then
	begin
		MessageDlg('Пустий довідник!',mtError,[],0);
		exit;
	end;

	if ( MessageDlg('Чи ви справді бажаєте вилучити цей запис ?',
		mtConfirmation,[mbYes,mbNo],0) = mrYes ) then
		begin
			WorkQuery.Close;
			WorkQuery.SQL.Text:=
				'DELETE FROM ADRESS WHERE ID_ADRESS='+
				IntToStr(ResultQuery['ID_ADRESS'] );
			ExecQuery(WorkQuery);
			ResultQuery.Close;
			ResultQuery.Open;
		end;
end;

procedure TAdressViewForm.ResultQueryDATE_ENDGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
	if ResultQueryDATE_END.AsString = '01.01.3000' then
	begin
		DateEndText.Visible := False;
                DateEndLabel.Visible := False;
	end
	else
	begin
		DateEndText.Visible := True;
		DateEndLabel.Visible := True;
		Text := DateToStr(ResultQueryDATE_END.AsDateTime);
	end
end;

procedure TAdressViewForm.FindButtonClick(Sender: TObject);
var
	s: String;
begin
	AdressSearchForm := TAdressSearchForm.Create(Self);
	with AdressSearchForm do
		if ShowModal = mrOk then
		begin
			if PlaceRadio.Checked then s := 'NAME_PLACE';
			if StreetRadio.Checked then s := 'NAME_STREET';
			if ZIPRadio.Checked then s := 'ZIP';
			if not ResultQuery.Locate(s,Trim(SearchEdit.Text),
				[loPartialKey,loCaseInsensitive]) then
					MessageDlg('Не знайдено такого запису!',
					mtWarning,[mbOk],0);
		end;
	AdressSearchForm.Free;
end;

procedure TAdressViewForm.FilterOnButtonClick(Sender: TObject);
var
	Field, FilterStr: String;
begin
	FilterStr := Trim(FilterEdit.Text);
	if FilterStr = '' then
	begin
		FilterOffButtonClick(Sender);
		Exit;
	end;
	FilterStr[1] := AnsiUpperCase(FilterStr[1])[1];

	if PlaceRadio.Checked then Field := 'NAME_PLACE';
	if StreetRadio.Checked then Field := 'NAME_STREET';
	if RegionRadio.Checked then Field := 'NAME_REGION';
	if DistrictRadio.Checked then Field := 'NAME_DISTRICT';

	with ResultQuery do
	begin
		Close;
		SQL.Strings[SQL.Count-2] := 'WHERE ' + Field +
			' STARTING WITH ''' + FilterStr + '''';
		Open;
	end;
end;

procedure TAdressViewForm.FilterOffButtonClick(Sender: TObject);
begin
	with ResultQuery do
	begin
		Close;
		SQL.Strings[SQL.Count-2] := '';
		Open;
	end;
end;

procedure TAdressViewForm.FormCreate(Sender: TObject);
begin
	ResultQuery.Transaction := PersonalCommon.ReadTransaction;
	WorkQuery.Transaction := PersonalCommon.WriteTransaction;
	ResultQuery.Open;
	GridResize(SpGrid);
	AdressViewForm := Self;
end;

procedure TAdressViewForm.SpGridDblClick(Sender: TObject);
begin
	OkButton.Click;
end;

procedure TAdressViewForm.OkButtonClick(Sender: TObject);
begin
	if ResultQuery.IsEmpty then
		ModalResult := mrCancel;
end;

procedure TAdressViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TAdressViewForm.FormResize(Sender: TObject);
begin
	GridResize(SpGrid);
end;

end.
