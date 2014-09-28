
{ -$Id: PCardsViewUnit.pas,v 1.1.1.1 2007/08/16 10:10:20 yaric Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Список личных карточек"                        }
{    Отображение списка личных карочек, вызов модуля                           }
{     редактирования личной карточки                                           }
{    Ответственный:Данил Збуривский                                            }

unit PCardsViewUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, Grids, DBGrids,
  ComCtrls, ToolWin, ExtCtrls, MainDM;

type
  TPCardsViewForm = class(TForm)
    Label3: TLabel;
    PCardGrid: TDBGrid;
    ResultQuery: TIBQuery;
    PCardSource: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolPanel: TPanel;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    Bevel1: TBevel;
    RefreshButton: TSpeedButton;
    FindPanel: TPanel;
    SearchLabel: TLabel;
    SearchEdit: TEdit;
    PCardCountLabel: TLabel;
    Label1: TLabel;
    ResultQueryID_PCARD: TLargeIntField;
    ResultQueryTN: TIntegerField;
    ResultQueryFAMILIA: TIBStringField;
    ResultQueryIMYA: TIBStringField;
    ResultQueryOTCHESTVO: TIBStringField;
    ResultQueryID_MAN: TIntegerField;
    ResultQueryFIO: TIBStringField;
    ResultQueryTIN: TIBStringField;





    procedure FormClose(Sender: TObject; var Action: TCloseAction);


    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PCardGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure RefreshButtonClick(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure PCardGridKeyPress(Sender: TObject; var Key: Char);
    procedure PCardGridCellClick(Column: TColumn);
    procedure PCardCountLabelClick(Sender: TObject);
  private
  //PCardsCount:Integer;
  public
  	Select: Boolean;
      Id_Filter_Department:Integer;
      DefaultDepFilter:Boolean;
      IsClick:Boolean;
      Cur_Date: TDate;	// дата, на которую смотрятся работающие
      Second_Date: TDate;     // если нужно выбрать работающих за период,
				// конец периода

        constructor Create(AOwner: TComponent);reintroduce;
		// начало периода работы, конец периода работы
  end;

var
  PCardsViewForm: TPCardsViewForm;


implementation

{$R *.DFM}

constructor
	TPCardsViewForm.Create(AOwner: TComponent);
begin

 inherited	Create(AOwner);

  ResultQuery.Transaction := MainDM.DMMain.DefaultTransaction;

  ResultQuery.Close;
  ResultQuery.Open;
end;

//


procedure TPCardsViewForm.FormClose(Sender: TObject;var Action: TCloseAction);
begin
	if FormStyle=fsMDIChild then Action:=caFree;
end;


procedure TPCardsViewForm.OkButtonClick(Sender: TObject);
begin
    if not ResultQuery.IsEmpty then
        ModalResult := mrOk
    else
        MessageDlg('Немає записів.', mtInformation,[mbOk],0);
end;

procedure TPCardsViewForm.CancelButtonClick(Sender: TObject);
begin
    if FormStyle=fsNormal then
        ModalResult := mrCancel;

	Close;
end;

procedure TPCardsViewForm.PCardGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    	case Key of
		VK_RETURN:	OkButton.Click;
		VK_BACK:	SearchEdit.Text := '';
        ord('Z'): if (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
            try
                ShowMessage('Id_PCard: ' + IntToStr(ResultQuery['Id_PCard']) +
                    ' Id_Man: ' + IntToStr(ResultQuery['Id_Man']));
            except
        end;
	end;
end;



procedure TPCardsViewForm.RefreshButtonClick(Sender: TObject);
begin
    ResultQuery.Close;
    ResultQuery.Open;

    PCardCountLabel.Caption := 'Клацніть тут, щоб побачити кількість карток';
end;

procedure TPCardsViewForm.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.Locate('FIO', SearchEdit.Text, [loPartialKey, loCaseInsensitive]);
end;

procedure TPCardsViewForm.PCardGridKeyPress(Sender: TObject;
  var Key: Char);
const
	LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
	LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
	Signs = '0123456789-()/\';
begin
	if ( Pos(Key,LettersBig) = 0)
	   and ( Pos(Key,LettersSmall) = 0 )
	   and ( Pos(Key,Signs) = 0 )
			then Exit;

	SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TPCardsViewForm.PCardGridCellClick(Column: TColumn);
begin
	SearchEdit.Text := '';
end;



procedure TPCardsViewForm.PCardCountLabelClick(Sender: TObject);
begin
    ResultQuery.FetchAll;
    PCardCountLabel.Caption:='Усьго особ. карток : '+IntToStr(ResultQuery.RecordCount);
end;

end.

