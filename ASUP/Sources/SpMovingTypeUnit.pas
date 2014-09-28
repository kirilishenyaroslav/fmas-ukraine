{-$Id: SpMovingTypeUnit.pas,v 1.1.1.1 2005/07/07 10:35:14 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Справочник типов перемещения"                  }
{    Отображает справочник типов перемещения                                   }
{    Ответственный: Кропов Валентин                                            }

unit SpMovingTypeUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, Grids, DBGrids, Db, IBCustomDataSet, IBQuery,
  ExtCtrls, SpCommon;

type
  TSpMovingTypeForm = class(TForm)
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    InputQuery: TIBQuery;
    OutputQuery: TIBQuery;
    OrderItemsGrid: TDBGrid;
    Panel2: TPanel;
    DBCheckBox1: TDBCheckBox;
    DataSource: TDataSource;
    InputQueryID_MOVING_TYPE: TIntegerField;
    InputQueryNAME_MOVING_TYPE: TIBStringField;
    InputQueryIS_FIRST: TIntegerField;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    InputQueryREAD_ONLY: TIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure OrderItemsGridDblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    constructor Create(aOwner: TComponent; aID_TYPE : Integer); reintroduce;    
  private
    { Private declarations }
  public
    ID_TYPE : Integer;
  end;

var
  SpMovingTypeForm: TSpMovingTypeForm;

implementation
 uses PersonalCommon, AddMovingTypeUnit, GoodFunctionsUnit;
{$R *.DFM}

procedure TSpMovingTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild
        then Action := caFree;
end;

constructor TSpMovingTypeForm.Create(aOwner: TComponent; aID_TYPE : Integer);
begin
    inherited Create(aOwner);

    ID_Type := aId_Type;

    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;

    InputQuery.Close;
    InputQuery.Params.ParamValues['IS_FIRST'] := aID_TYPE;
    InputQuery.Open;
end;

procedure TSpMovingTypeForm.OkButtonClick(Sender: TObject);
begin
    if InputQuery.IsEmpty
        then
  	        MessageDlg('Пустий довідник!', mtError, [mbOk], 0)
        else
            ModalResult := mrOk;
end;

procedure TSpMovingTypeForm.OrderItemsGridDblClick(Sender: TObject);
begin
    OkButton.Click;
end;

procedure TSpMovingTypeForm.AddButtonClick(Sender: TObject);
var
    temp : TAddMovingTypeForm;
    i : Integer;
begin
	if not GPP_Check then Exit;

    temp := TAddMovingTypeForm.Create(Self);
    temp.Caption := 'Додавання нового типу переміщщеня';

    temp.Is_First.Checked := (ID_TYPE = 1);
    temp.Is_First.Enabled := False;

    temp.ShowModal;

    if temp.Is_First.Checked
        then i := 1
        else i := 0;

    if (temp.ModalResult = mrOk) then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE INSERT_MOVING_TYPE(' + QuotedStr(temp.MovingTypeEdit.Text) + ',' + IntToStr(i) + ');';
        ExecQuery(OutputQuery);
    end;

    InputQuery.Close;
    InputQuery.Open;

    temp.Free;
end;

procedure TSpMovingTypeForm.ModifyButtonClick(Sender: TObject);
var
  temp : TAddMovingTypeForm;
  i : Integer;
begin
	if not GPP_Check then Exit;

    if not CheckForFillBool(InputQueryREAD_ONLY.Value <> 'T', 'Цей тип переміщення неможна змінювати!')
        then Exit;

    temp := TAddMovingTypeForm.Create(Self);
    temp.Caption := 'Редагування типу переміщщеня';
    temp.MovingTypeEdit.Text := InputQuery['NAME_MOVING_TYPE'];

    if InputQuery['IS_FIRST'] = 1
        then temp.IS_FIRST.Checked := True
        else temp.IS_FIRST.Checked := False;

    temp.Is_First.Enabled := False;        

    temp.ShowModal;

    if temp.Is_First.Checked
        then i := 1
        else i := 0;

    if (temp.ModalResult = mrOk) then begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_MOVING_TYPE(' + InputQueryID_MOVING_TYPE.AsString + ',' + QuotedStr(temp.MovingTypeEdit.Text) + ',' + IntToStr(i) + ');';
        ExecQuery(OutputQuery);
    end;

    InputQuery.Close;
    InputQuery.Open;

    temp.Free;
end;

procedure TSpMovingTypeForm.DeleteButtonClick(Sender: TObject);
begin
	if not GPP_Check then Exit;

    if not CheckForFillBool(InputQueryREAD_ONLY.Value <> 'T', 'Цей тип переміщення неможна вилучати!')
        then Exit;

    if (not InputQuery.IsEmpty)
    then begin

        if MessageDlg('Ви справді бажаєте вилучити цей тип переміщення.', mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then begin
            OutputQuery.Close;
		    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_MOVING_TYPE('+ InputQueryID_MOVING_TYPE.AsString +');';
		    ExecQuery(OutputQuery);

            InputQuery.Close;
            InputQuery.Open;
        end;
    end
    else
        MessageDlg('Немає пунктів для вилучення або цей пункт неможливо вилучити.', mtError, [mbOk], 0);
end;

procedure TSpMovingTypeForm.CancelButtonClick(Sender: TObject);
begin
	ModalResult := mrCancel;

	if FormStyle = fsMDIChild
        then Close;
end;

procedure TSpMovingTypeForm.FormResize(Sender: TObject);
begin
    GridResize(OrderItemsGrid);
end;

end.
