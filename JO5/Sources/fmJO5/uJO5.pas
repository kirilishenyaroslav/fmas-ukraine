unit uJO5;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uJO5                                                                       *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Просмотр журнала-ордера №5.                                                *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, DB, FIBDataSet,
  pFIBDataSet, cxInplaceContainer, cxTLData, cxDBTL, cxControls,
  cxSplitter, ExtCtrls, dxBar, cxMaskEdit;

type
  TfmJO5 = class(TForm)
    brJO5: TdxBarManager;
    pnlDescription: TPanel;
    cxSplitter1: TcxSplitter;
    trlShet: TcxDBTreeList;
    cxSplitter2: TcxSplitter;
    pnlGroupElements: TPanel;
    trlSchGroups: TcxDBTreeList;
    cxSplitter3: TcxSplitter;
    trlSmRazdSt: TcxDBTreeList;
    dsrSchet: TDataSource;
    dstSchet: TpFIBDataSet;
    trlShetcxDBTreeListColumn1: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn2: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn3: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn4: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn5: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn6: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn7: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn8: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn9: TcxDBTreeListColumn;
    trlShetcxDBTreeListColumn10: TcxDBTreeListColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses uDataModul;

{$R *.dfm}

procedure TfmJO5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmJO5.FormCreate(Sender: TObject);
begin

	if Assigned( dmdDataModul )
	then begin

		with dmdDataModul.SysOptions
		do begin
			dstSchet.Close;
			dstSchet.SQLs.SelectSQL.Text := 'SELECT * FROM JO5_GET_ALL_SCH_OBORT(' + IntToStr( DefRegUch ) + ',' + '''' + DateToStr( CurrDate ) + '''' + ',' + IntToStr( RootTypeObj ) + ')';
			dstSchet.Open;
		end;

	end;

end;

end.
