;;; op-template.el  -*- lexical-binding:t -*-

;; Copyright (C) 2023 Aziz Ben Ali

;; This file is not part of GNU Emacs.

;; Permission to use, copy, modify, and/or distribute this software for
;; any purpose with or without fee is hereby granted, provided that the
;; above copyright notice and this permission notice appear in all
;; copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
;; WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
;; WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
;; AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
;; DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
;; PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
;; TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
;; PERFORMANCE OF THIS SOFTWARE.

;;; Commentary:

;; op-template.el provides the XML templates of https://grtcdr.tn.

;;; Code:

(require 'shr)

(defalias 'sexp->xml #'shr-dom-to-xml)

(defun op-template-stylesheet (filename)
  "Format filename as a stylesheet."
  (sexp->xml `(link ((rel . "stylesheet")
		     (href . ,filename)))))

(defun op-template-footnote-section ()
  "HTML snippet representing the footnotes section."
  (sexp->xml
   '(div ((id . "footnotes"))
	 (h2 ((class . "footnotes"))
	     "%s")
	 (div ((id . "text-footnotes"))
	      "%s"))))

(defun op-template-main-footer ()
  "HTML snippet representing the footer section."
  (sexp->xml
   '(footer nil
	    (p nil "&alefsym;")
	    (p nil
	       (a ((href . "%l"))
		  "What's changed?")))))

(defun op-template-post-footer ()
  "HTML snippet representing the postamble of a post."
  (sexp->xml
   '(div ((class . "post-footer"))
	 (p nil
	    (b nil
	       "Got something to share?"))
	 (p nil
	    (a ((href . "mailto:%m?subject=[REPLY] %t"))
	       "Tell me about it")
	    ". If you found a problem with this page, please"
	    (a ((href . "%e"))
	       "propose an edit")
	    "."))))

(defun op-template-dotfile-navbar ()
  "HTML snippet representing the preamble of the dotfiles publishing
project."
  (sexp->xml
   '(nav nil
	 (ul nil
	     (li nil
		 (a ((href . "/index.html"))
		    "Home"))
	     (li nil
		 (a ((href . "/dotfiles/sitemap.html"))
		    "Top"))))))

(defun op-template-main-navbar ()
  "HTML snippet representing the preamble used across the different
publishing projects."
  (sexp->xml
   '(nav nil
	 (ul nil
	     (li nil
		 (a ((href . "/index.html"))
		    "Home"))
	     (li nil
		 (a ((href . "/dotfiles/sitemap.html"))
		    "Dot"))
	     (li nil
		 (a ((href . "/now.html"))
		    "Now"))
	     (li nil
		 (a ((href . "/contact.html"))
		    "Contact"))))))

(defun op-template-metadata ()
  "HTML headers shared across publishing projects."
  (concat
   (op-template-stylesheet "/css/def.css")
   (op-template-stylesheet "/css/common.css")
   (op-template-stylesheet "/css/heading.css")
   (op-template-stylesheet "/css/nav.css")
   (op-template-stylesheet "/css/org.css")
   (op-template-stylesheet "/css/source.css")
   (op-template-stylesheet "/css/table.css")
   (op-template-stylesheet "/css/figure.css")
   (sexp->xml '(link ((rel . "icon")
		      (type . "image/x-icon")
		      (href . "/assets/favicon.ico"))))))

(provide 'op-template)
;;; op-template.el ends here
