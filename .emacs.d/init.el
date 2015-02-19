; ロードパスの設定                                                             
(setq load-path (append (list
                         (expand-file-name "~/.emacs")
                         (expand-file-name "~/.emacs.d")
                         )
                        load-path))
(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;パッケージ管理URL
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


;; まず、install-elisp のコマンドを使える様にします。                          
(require 'install-elisp)
;; 次に、Elisp ファイルをインストールする場所を指定します。                     
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")


;;anything
(when (require 'anything-startup nil t)
  (global-set-key (kbd "\C-x b") 'anything)
)

;;YASnippet

(require 'cl)
(fset 'yes-or-no-p 'y-or-n-p)
 
(add-to-list 'load-path "~/.emacs.d/elisp/yasnippet")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(yas--initialize)

;; 単語展開キーバインド (ver8.0から明記しないと機能しない)
;; (setqだとtermなどで干渉問題ありでした)
;; もちろんTAB以外でもOK 例えば "C-;"とか
(custom-set-variables '(yas-trigger-key "C-"))

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;;auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20130724.1750/dict")
(require 'auto-complete-config)
(ac-config-default)
;; C-n/C-pで候補選択
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;; yasnippetのbindingを指定するとエラーが出るので回避する方法。
(setf (symbol-function 'yas-active-keys)
      (lambda ()
        (remove-duplicates (mapcan #'yas--table-all-keys (yas--get-snippet-tables)))))

;; ctrl+h BS
(keyboard-translate ?\C-h ?\C-?)

; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
