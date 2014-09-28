{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Пакет "Справочник надбавок"                             }
{                 Модуль отображения истории изменения надбавки                }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Raise_History;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, uSearchFrame, Grids, DBGrids, U_SPRaise_DataModule, SpCommon;

type
  TF_SP_Raise_Hist = class(TForm)
    DBGrid: TDBGrid;
    SearchFrame: TfmSearch;
    DS: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    DMod: TDMSPRaise;
    { Public declarations }
  end;

var
  F_SP_Raise_Hist: TF_SP_Raise_Hist;

implementation

{$R *.dfm}

procedure TF_SP_Raise_Hist.FormCreate(Sender: TObject);
begin
  GridResize(DBGrid);
end;

procedure TF_SP_Raise_Hist.FormResize(Sender: TObject);
begin
  GridResize(DBGrid);
end;

procedure TF_SP_Raise_Hist.FormShow(Sender: TObject);
begin
  DS.DataSet:=DMod.FIBDataSetHist;
  DMod.FIBDataSetHist.Open;
  SearchFrame.Prepare(DMod.FIBDataSetHist,DBGrid);
end;

end.
